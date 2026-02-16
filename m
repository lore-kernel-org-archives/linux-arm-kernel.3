Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD50E7BD92
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 11:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YsaC29hc1Q/uN7FPMQZFz9kToVmMSvZKatdHYOoHKnU=; b=nd/G9J1Z6plTcKLgG6+iA9UxF5
	Y/SC94Y6DOdLehG6TkeTbtIgTP9x9hQCP1KX0vHI+6N+C377AxIw/W9eKX+qzqwH5pHcLitjnXMb/
	RB5mBWDd7rPmZJ4iFsLm+9oTCRDqKeGtvl4nTMhQIk4Hn/9y85qcA3I2+H67b/EdMBRjBZEPpb4Fw
	9vy8+so9H+vYQPe97W9V7DX4Xa3mChVfFRdqO7P7D+PYQMhhFOHlwqJnVN0k7Cfm5OMtM7U1Ur5Je
	naiRuWEqKsYZ5/IyXih78ctrJl6G4kUx7pSfbirqm/OZYxlHmFw9fX/RiYH/uEjssvL6KKN6RF0gw
	rDem3KBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwOx-00000006PEp-2ElX;
	Mon, 16 Feb 2026 11:04:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwOu-00000006PCj-1huw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 11:04:25 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GA5QcE3240052
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 11:04:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YsaC29hc1Q/uN7FPMQZFz9kToVmMSvZKatd
	HYOoHKnU=; b=pUzxK5ppqodJ+kBBatU0/ZZj0hN56jH0XF3u43GpXPGxKdPVcqI
	nHR84PfFEDVP1BSYvddsECVpz3ZfK0mbD7SQiR8TLvuheIYJh56KDVm2JWuLhrm1
	W2D6kDQZ9QEsonkmKlzW7nTYuZnCmb0XGg8WTHoA3XPlT7xx9sShbgivUK7a8gxX
	RkdpFu6jYS1kTmbdZ217RmTsP4wWJdWHxe6Myk0MRib7e+Uq9sqwTWxt/3ltAKyY
	DBALlm0z8S88lV9qeHTp6aajLr56UlNIJFPDkBlpSFybKeQvHATieZ2l8GV+A2Ld
	9ynsbHSPckhZ0Xed1BXUHj0pcrjcg/7vbCw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4caj7jc4t4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 11:04:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71500f274so321262785a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 03:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771239862; x=1771844662; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YsaC29hc1Q/uN7FPMQZFz9kToVmMSvZKatdHYOoHKnU=;
        b=BpnL8aRwxuSH8ukBwkxy7nqAeLmfFz2Cx6vQllRaZZD2/8nP8ZcxFJWYf0RnxrHnz8
         Wfjl0Ey6S7n6Tox3efnqmaIn3OQYrG6VKV7PgF5cktjRfWaPmOfB6G9beoiKhZ258CSu
         Ktk0yu3A3/n4MPJbzEbK7j/GOXYTgghqTGe6MRGGQcijpf7myIPAA+xeOhi+ywhPnL6P
         9O8hJ3hWp/f8f6+J/5G7rr2Q7RYm1vqQjCXGlYxw5DVCieKqkpryW74/SYoLQwCq0a0i
         WXOMrRV8WvmQZ1hHRcVFNulgMW07NOSQU6qyXjFY5Pw+xYC5yRr54AS708cI5JDYWWF4
         WaFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771239862; x=1771844662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsaC29hc1Q/uN7FPMQZFz9kToVmMSvZKatdHYOoHKnU=;
        b=eS1g5rzw2vQ47VJC1Rm6CDzDNWblOU92P+oF6cXJpkLb5jRQI339dNQHCHvsIR0qPi
         rLCIgIOqY6NkYC+m7EbP/MovjG4wkdEYH+z+4UpBfGSdM0x48thLqfx8ob0Kl1+geIb+
         uwCZd4S8v/MIVbCGSRokdrFBBO91qN/BDKTOCMvJqrn+blMNP0yaN5fTZqlgHrtoCnIB
         NRqfOTvNHBDolbv2HHKIk/wmmhyzBrQYJZe+dM6ykusm4JzDdXZGRn0h2EZFIjpN514w
         CWKK3ONcooSpI9SeZEQUSykTkGi+zKpGYGKiHStV6SCln8uRIlrKj4w4rpf0rtJYmtk/
         QtTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdrh+rbrV6d5RWGXudd813thyy0D6xK+PuNaN9O5QduwyZAe2QnHAPMG0j2C9CVUHXxsT6Wv5DuQ+EKOhkvIcQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxuwQiXLBAO+VqCjKmCJSQiW+tzLRn9mCYifEgHoAXguBeOFJV7
	BdDrylK9MZ5HzrUt36T1xenAXCTFNqThVdSFPAKhvOXyAMFa0mzRHRRFqInC32Iew95myTvOhGl
	3fRtczRr0Gk6HgbRNEpY6FdWpc4jwW8RDmt2NvS3G4j3FZuUVL3GKOlhAY0ci4wYsYgFca5v2mm
	I4jajx903K1A==
X-Gm-Gg: AZuq6aIK81WIbvQLcUtMvB0X5BGAs12Prqf5wARTGhT6EmpLA7MYIBMBkVZ8Q3iXszo
	X53FgfVGOf+VdLW89rntDv/84BntMdFEujPRF8uf7deHoXmnbU0JCmwyqBzzherTYBThBqPHVu2
	rbZ6UMkldNWUwuV435zFotVkAaD7C8RtTDn5+H3usBTJsmabmEgfQjlrKY34d9xPnsPnTK8vxUe
	TxxQvmBasasYv+NIzp7nZKZGuRtDd+K8TTL4FZhTdGCzFwKWrd8PvdS58AlMqJD6cdmbRd3QYnE
	j70iiPvyctV661i0boQwXHQCZpPTzrwUllgtk+oKQeyfP8NmfAxnE7ZSeRmPhWBua7DXvnFlRGZ
	Ofo4PBHzImv/h/iUdP0BuhuaE/QVeEzIGT9dChQ==
X-Received: by 2002:a05:620a:458f:b0:8a2:e1db:f442 with SMTP id af79cd13be357-8cb422b2fa6mr1150430485a.30.1771239862529;
        Mon, 16 Feb 2026 03:04:22 -0800 (PST)
X-Received: by 2002:a05:620a:458f:b0:8a2:e1db:f442 with SMTP id af79cd13be357-8cb422b2fa6mr1150427885a.30.1771239862105;
        Mon, 16 Feb 2026 03:04:22 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d99497asm589572745e9.6.2026.02.16.03.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 03:04:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/3] phy: apple: atc: Make atcphy_dwc3_reset_ops variable static
Date: Mon, 16 Feb 2026 12:04:14 +0100
Message-ID: <20260216110413.159994-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=896; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=UIwNr/KY2E+0ecUw9P2/kbSYuPp+7DKAt1dGLTzex10=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpkvmuzb0vB7oi4pn/35nXpGsWObsKmVUpTChgV
 lEXrNPSfJqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZL5rgAKCRDBN2bmhouD
 15lBD/9b781t2vSYMqy9NeIzD45ooVBI2AP+j3b68mE6MAzdwlE6C5SfFYOsu3FEwnFziEKY3Ot
 xIRRsy2mpvb10akE0ks+pptxAP9eYmh6U+XHUSWMR6oFYwIo78sDYt6IyFh7qoRN++jOCGn48vt
 zRPJDrj2Diq8Hw7/hDrmxzUHE6gPZfMZtx7oFh+bTkC6NqhkILSlE5nQ0QYnfko41bPtvPYvKz2
 kh0mIc8OiM9XH2OnMR0IYl40IXiOOG1gfaMymm1NU7XBU1k9yRns+CizJEf/KvQj//8ZNYfwUhp
 N7IpPE6T5IlmXt/E4LHw/HGU4ACBp6sNbJKcqovAmujuiFYH0e8Gw4QKEskOHBEjnvyJ4Zai4EM
 UCUvxXBG9Qzi0xIJoQ/jJa2dzzvEEJ8Udrwf7Dni8RVAGrcnv/LI2qxlk4KLu4pMF9xj23QXWqX
 8/NrynqeLalAte5MR7suZp5nveZdoTYrmt3cVwV7HvPT4bsjpbM0wDLqcwR1N0Mme3dqT3V3KM+
 ehQomFxZedoDQIIKC6E6VOvJPbi1e0Zoje91GCZ/XnNu9Kmn/zeUHlKIP4V2TjiVXXAvolgeQf2
 HFw95Z5fg6pUxYfEYttaKMAFqip4JgTbdGFcmBfhIPPLvVJbx9WL06wFnePz1n+LlVNrt0oMOH9 11DeE6vi6MJa5kQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dIurWeZb c=1 sm=1 tr=0 ts=6992f9b8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=V4RP2X7TQvdl7F27wUAA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5MyBTYWx0ZWRfX5xIJNp6xa2nX
 u6QEPcZGoBkmELBRFPZopuQC7hR2NjJAulvUoi5HQneaFJEu2EiO4nYgyrEQMx/mu744it7Fgh6
 WolDqA8sqEEUnh6oums1rvQiQW890DqW6GLL7ncgq+o0uDFIJEln+0aDR35/FkHFiN49CBa5sBv
 ynXEA/CyRRQT1nzvks9xUJHzRFuqIqLgAc3q9w7+WT93ETjhIJL75BN9Ek1dCfIAo5cJAAKAIso
 he8rS19Tqhc5Xy9YomiowrNI0Oya3S8bXoF/V/bFkWURVQ9b78U3kJFGZbhjR89YMr73jT+BWIs
 6rwDvdjRDCDz+83IaBxCMKqRxrSnMQyg4TPBW7Qn0lYZTJg+9LxmcQPont9bpq07SXD+flYhWa6
 jWlRhDoMQMHhbcAQQ6CBw29+4FHagwCD9cjDWITjcXIpVLbuq6QWI/1gCjcpa+T/sLrlS9dCX7N
 8dFkWuTuFqviDV1fT0w==
X-Proofpoint-GUID: Hn-kETTygXEzrErPIyiXnURd0t-qEMa-
X-Proofpoint-ORIG-GUID: Hn-kETTygXEzrErPIyiXnURd0t-qEMa-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_030424_473124_77C1DD7A 
X-CRM114-Status: GOOD (  14.99  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

File-scope 'atcphy_dwc3_reset_ops' is not used outside of this unit, so
make it static to silence sparse warning:

  atc.c:2026:32: warning: symbol 'atcphy_dwc3_reset_ops' was not declared. Should it be static?

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/phy/apple/atc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
index dc867f368b68..32d97226e926 100644
--- a/drivers/phy/apple/atc.c
+++ b/drivers/phy/apple/atc.c
@@ -2023,7 +2023,7 @@ static int atcphy_dwc3_reset_deassert(struct reset_controller_dev *rcdev, unsign
 	return 0;
 }
 
-const struct reset_control_ops atcphy_dwc3_reset_ops = {
+static const struct reset_control_ops atcphy_dwc3_reset_ops = {
 	.assert = atcphy_dwc3_reset_assert,
 	.deassert = atcphy_dwc3_reset_deassert,
 };
-- 
2.51.0


