Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C9A5CC6B08
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 09:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t8jZfqJRI2S17ZqhdokW6eWwYPPDaxj1chnAHFoBSl4=; b=O/Arxh9Yt3c30M34dbf1+vb74c
	y+e7JEyQt/sl7VZlxlA/WFjpEKj1/JGoi7OqAc3/bez9Ddr4jhguShUy6UmDlf6brhTrTuWTEtMNc
	Vwpk8oGfamfjlEVv7+ZO/KuKAQjIa1TTKxXOLTCS/wcqiQFe9Axl0ReyfyQZBknhlVX1ZyI60Iv60
	5VW4jd5OlKnY880l0k6oNWjGxgJLai41kIVcmGCxwU8LtB5rDkujmi2NixPEQLGqYFJxqg+5MBlhl
	nNYHI74pbIchzL9acWqlqMbJ5OdSimZ9hlZ4gf2Qh0g4XELlyptgl7XVfyv2lqvN2yTgMnl8ZUh4F
	mOt1c9OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZHO-0000000CUuP-2skf;
	Tue, 13 Oct 2026 09:58:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZHM-0000000CUpv-1CO4
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 Oct 2026 09:58:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=t8jZfqJRI2S17ZqhdokW6eWwYPPDaxj1chnAHFoBSl4=; b=WzipXA+hP4QRFUMQ8jGn0BXS9Q
	Optiy09rDURSp+zh8/E6lL4+MNaas/PVfUkmzQQLdVJFFPv+QI9DuWVwMXtwL47jxahhKAZ4Z78zb
	3U5Ba5RI4OikTGEyOzeCD9YxxGYxJPGfqcXguXM22uV5DCVY6HYdISXhfofsLE2YmksURjB3MOV0b
	jwuUTuw8CMl98/nMg03BFm9fVMC+AY6Hu7RfbUl48LxDDhVj6Svyo2yjchZ97RUIJHwKEz/gICXA8
	JpSvLbVo4dqurp2swrEm3xk/x+wHTNkpal3Celd9vGqIME21iosB1IraU2x9mk1QKTnC7T0nfrwBO
	vvAdPQiA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGZHE-0000000FNcZ-3yoR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 09:58:36 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6CS5F949406
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 09:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t8jZfqJRI2S17ZqhdokW6eWwYPPDaxj1chnAHFoBSl4=; b=AA0X4csRJG906bfq
	pjdi/auibAZjYv7gE7yHHTkVsQNyRDcVM3rA4tOWTfC0OxHqnR4yxPaYSK+fs/LZ
	Gf1vRKO4dCAG4G9M5Uc4+eRtC8hmPWyn4Fj4EmhJ1zyR9vmmUjsehV9ie1bjSauX
	nBeZHunxj5IA7CkvMqmTii5fQRbLbkkBAMJ1Y781BX/hUmg/ynNYAZN+pCBJK/fE
	XfhwGOY37Sou9dHCNKqKTvT6Ao3EvsFynJ/vg/onDR0+BrVxmjc54du+EPAIikmB
	2sl1qvcNEYZZ8s6XK+5M5Dk0WDA0tWAkLuY7qyk2Pv4/3r/4nE6RhysqCHXOueSM
	Mlbt3Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f628x96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 09:58:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934956beec8so537362885a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 02:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885511; x=1792490311; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t8jZfqJRI2S17ZqhdokW6eWwYPPDaxj1chnAHFoBSl4=;
        b=fZwiHUus8FPuIZoc4VZFnJKtvWiYGZwKuHHjVBrhhjqEmuMVyG4/5/pS/onSaBPZT6
         /ePnltdVs5F/OCqwXA+NeXqY57km/aEUguVdFNjowxBpqMobTC1hBvyQ4Og/801C581i
         mD361yBfhSdPiKScRbIHMJDLpJgCvwY/IB+4Io1V0FFgv3KYJpUVTRrh36uFYWgoK0Jz
         vxc2wPm3JNab90mcc+zAg0pL/NL7DP9s2ZzIpTweRNJMKIagxboHYw9sCQ/4Nu9zrYc5
         PVZYttrREqdWBmsi+Yc5l/Czby8Fzpyod9d5hoUkaJ7Jh4z6H32CCNBZ6983IQyPbleZ
         Q33w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885511; x=1792490311;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t8jZfqJRI2S17ZqhdokW6eWwYPPDaxj1chnAHFoBSl4=;
        b=tLkHkJUQgBA0nm2SYAuCQ2ISTwRFpmVHaoG18U3Bf0Gq3ZB3kfRtji9wQ0ZL/btv40
         AmgOSWnrxAsUmLs1NWcOy4vMKFBDUHcw/k8wnmE96wlEaNJNP1t3LqgSTkGD/5FKnVIt
         H5Apb22ZDt9NzPE14LRa2NAJMrsuf4a6F7n3YpvTfCvKyr3dQnyKkP0CAKRkka98V+vU
         6oZcsMNWUFUIhhGYzvczs/itkuUBhxig6TkzHrIxayhLdHvSINAAMxinxEF07/H7CbBK
         LN22dV23iUsPOkhveV1vJ1oG42g5LCf4QRnsvFOiov4A2Fz2CnGXEyhPybMIERHbjFPf
         Kolw==
X-Forwarded-Encrypted: i=1; AKwUvBwzo8wlICqUjiIypNI3hGh/Xtob11pCn9B6xq99Di6kHtCuhdiQoqN/fqOK999wMI4d2jNstl1HMJZAqlPXvZiO@lists.infradead.org
X-Gm-Message-State: AFq9FYKxcvrE//caqo9Y/LOVXJqIrw6rHU6+Tzm9H5isIpTIwWBqryC7
	FnWp0DwpOCu5Vhii8QCw37OqxJ5o58+XI8xnt8nsGMkE8snJzxR0JC7HbqrVmG0/FWe7gRPqHg1
	8EqwF4CU6xcEjPby4Uol6RHOm4Tij4HcZDvPfgNPxM9hy2+XD0EyGJ+Uol+WNs4wbKhmPCUHNm2
	NuEA==
X-Gm-Gg: AYBFou2aB68ZFXMV5Zo6daGUYQrWd6+JGI2ejkyZHZZXwVc+3I778QujzYOaGOk9rGL
	/6tWfI/UNu6Q+Tqx85Elis8uqMS55CQNCKM35dygmT4U2eT6KM9a+6H5QLQXzAAtwBAKRRxZ80g
	J5SpXp0sBdbaff4if4qs2BWMPRr91q86D5GLhU8Nly3FIzyBWNHf4gk0ZojWRX9r1f4IjWIoN3l
	N1ThTUV0r+zuiBYWU7koM4SSoS4tHXeRkWdpsICRsZWBDH+BDY+d6W1WyiJkZRQMfio1g1RzgVQ
	1Y2wdIzLEtYw7swLO4CE66Lh2SVWwtD9T4egVI4Qv/OaSDmoFOmjWdWLFGupjhJ2wqaRMqxAdys
	wGSzIJBHWQiSaiRab9EjwUWAPJd6k
X-Received: by 2002:a05:620a:371b:b0:912:1206:ddd1 with SMTP id af79cd13be357-93ebd0e4d43mr1969566285a.1.1791885510392;
        Tue, 13 Oct 2026 02:58:30 -0700 (PDT)
X-Received: by 2002:a05:620a:371b:b0:912:1206:ddd1 with SMTP id af79cd13be357-93ebd0e4d43mr1969564785a.1.1791885509872;
        Tue, 13 Oct 2026 02:58:29 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6beaesm209412025e9.0.2026.10.13.02.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:58:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:57:40 +0200
Subject: [PATCH v10 11/14] crypto: qce - convert to auxiliary bus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-qce-fix-self-tests-v10-11-57162a38a554@oss.qualcomm.com>
References: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
In-Reply-To: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14790;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Eg7+chEgs398447bUxQxnh1SE/r4A6n/ZRbc+Wj1DQc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzgCk40L2g5R1tnZ6+KPKznXQE/UMntB6OqClS
 ajJGoXEsUSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4ApAAKCRAFnS7L/zaE
 wy3qEACjEIN1XzpNvKgGJ/qfi4/V8bEzX8cJO0BN+qXuUiqyya/owMiawAvu0LOcb3Uq5ZVyJik
 D5INhY8Pp3MBbu4AYOP1vTqWvtvN/msYC8kAGWV/Z1nFwA9ifPfD9SLorF7BRw2YUhPnsS+p7S+
 v7D1NGwDf2RJV/ekgl3l1SNNUFw3gGWyBATNSZByLh96WB59RAjSEU26UnbF/DuaC7r5RNDF6Al
 0UMHhOIGo8BLDJif7dofWNFXOeUP+n7yzaIIqWvb32WhDgQExzdgUy69zdkHr003Lzf1G52hGAt
 lKMhWGlrD6QqJNdItGbyXBNcn/Gba+SfeSC+wDOacaNqsn/+8xSYR4Q8v6ZwRax41vFL/m92oEM
 ThrgEw50FSmdRhEzPqfCr74uHWcQKNc/GciU7ctdf5AjpL+9JmPSuAb7UD7fQISn+MVranK8TIf
 GGV49jmucGNwjUJVLEFEMhEqTk/MegvOuXAway3vnkstKRPWDHNanj6UBKu2wJ0wW1D1TPPd1B2
 uVpypAt2AZi3FXNmEP+MeJHifuPczOSRDgf8Sa15VQZ8unHoSQRHOXJDZ1HIlvC+tOGZeosStaL
 5o2Nn0NI/Jhm5X80Z79zJfS0blhxVeM23e3jViTSX/7KCI+PK3362GhHBqXkyHGq0Rlnx741GSx
 rn2sCAu3fJhovVw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6ace00c7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=WPyFHUJR_z9Wl-EIX7EA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX50P2jFbfOuN7
 5uS4QLNvHEIBoJKuLJRF6C9TtjzvpzPaPVBU1X7OjRbl5ESby1ULvQui8pBlzEhQGXg2zxB+lxa
 rHVCyITBoDvz5mCOft9CSxSN5w/WzQE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfXxTB3toq85Ate
 QSn+EaLrOmJXSI6dN/BZzhw2FUgdUHlyZGIRNc5VFdj+WmFTuHijoYV5UVn73oaGSre1vqdVTEM
 oRM76QUfoHc23F6GbzFKXNFUyHXl07vgGvtZLcu0Ql9gusBiKljoqpbSRrqHzpWvX/GfxWNJdnm
 P4NzCMtROqjZ2rNcgtyDradHZyrLPuNN8yfgCm/uUadDG5OBtj1a+mcbpl4gVDyEnTYUlw9B6yc
 PtOo9VqOB5lZ+bqcOu3xAHMWi56TEwlCjfKcxUISqkbJeUIm1lR6w2cEat3ImxAkjqtk+LwWbbB
 nKCag8tNjEaaK4QFIW7xmvqFcUr6j4IIp3k2cr8ddnhGrS9q0NqEH1DRzOS1TfFwXRH6GrayOfJ
 k5KxX5mum10NRc60M4GmjhpTEex60AlC8xMtYYrt0J5Bb1tzqABphWnW2GXN9WzVWq6x5etEhik
 pFmEGWYkBDZQM6ErF/A==
X-Proofpoint-GUID: 1EJEl6oJ4fJpJDYYDaLBXZ-3NwaRI86O
X-Proofpoint-ORIG-GUID: 1EJEl6oJ4fJpJDYYDaLBXZ-3NwaRI86O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_105833_472487_B9137B8A 
X-CRM114-Status: GOOD (  28.68  )
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

This driver is disabled in arm64 defconfig but one of its
functionalities - scaling down the interconnect votes to 0 when unused -
will be moved to an always-enabled core qce driver. This upcoming core
driver will also be in charge of registering the qcrypto device on the
auxiliary bus so that it may be enabled if desired.

As the first step: convert the driver to using the auxiliary bus and
remove the interconnect management from the code. Update the power
management as required and make sure to use the parent struct device
for DMA.

Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/Kconfig        |  2 +
 drivers/crypto/qce/aead.c     | 12 +++---
 drivers/crypto/qce/core.c     | 95 ++++++++++++++++++++-----------------------
 drivers/crypto/qce/core.h     |  5 ++-
 drivers/crypto/qce/sha.c      | 12 +++---
 drivers/crypto/qce/skcipher.c | 12 +++---
 6 files changed, 67 insertions(+), 71 deletions(-)

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index adcbe15851899917fb3039efe89a77c8fe712bf1..b3fa1f6135bce345cc58387aac7ba803a82aff69 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -530,6 +530,8 @@ config CRYPTO_DEV_QCE
 	tristate "Qualcomm crypto engine offloader"
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on HAS_IOMEM
+	depends on PM
+	select AUXILIARY_BUS
 	help
 	  This driver supports Qualcomm crypto engine offloader hardware. To
 	  compile this driver as a module, choose M here. The module will be
diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index 75a1df138dbea312ad660fa06997bcd3022687cc..6d14a5812687f977c317d88615522e27211f29b9 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -44,9 +44,9 @@ static void qce_aead_done(void *data)
 		dev_dbg(qce->dev, "aead dma termination error (%d)\n",
 			error);
 	if (diff_dst)
-		dma_unmap_sg(qce->dev, rctx->src_sg, rctx->src_nents, dir_src);
+		dma_unmap_sg(qce->dma_dev, rctx->src_sg, rctx->src_nents, dir_src);
 
-	dma_unmap_sg(qce->dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
+	dma_unmap_sg(qce->dma_dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
 
 	if (IS_CCM(rctx->flags)) {
 		if (req->assoclen) {
@@ -442,14 +442,14 @@ qce_aead_async_req_handle(struct crypto_async_request *async_req)
 
 	if (ret)
 		return ret;
-	dst_nents = dma_map_sg(qce->dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
+	dst_nents = dma_map_sg(qce->dma_dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
 	if (!dst_nents) {
 		ret = -EIO;
 		goto error_free;
 	}
 
 	if (diff_dst) {
-		src_nents = dma_map_sg(qce->dev, rctx->src_sg, rctx->src_nents, dir_src);
+		src_nents = dma_map_sg(qce->dma_dev, rctx->src_sg, rctx->src_nents, dir_src);
 		if (src_nents < 0) {
 			ret = src_nents;
 			goto error_unmap_dst;
@@ -478,9 +478,9 @@ qce_aead_async_req_handle(struct crypto_async_request *async_req)
 	qce_dma_terminate_all(&qce->dma);
 error_unmap_src:
 	if (diff_dst)
-		dma_unmap_sg(qce->dev, req->src, rctx->src_nents, dir_src);
+		dma_unmap_sg(qce->dma_dev, req->src, rctx->src_nents, dir_src);
 error_unmap_dst:
-	dma_unmap_sg(qce->dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
+	dma_unmap_sg(qce->dma_dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
 error_free:
 	if (IS_CCM(rctx->flags) && rctx->assoclen) {
 		sg_free_table(&rctx->src_tbl);
diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 5b1bf7a50f88c890da1f0820fb9e070b3d3f4708..f177cbb7e57f27dbf50abc8d847e21ff39dc0fbb 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -3,15 +3,16 @@
  * Copyright (c) 2010-2014, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/device.h>
+#include <linux/device-id/auxiliary.h>
 #include <linux/dma-mapping.h>
-#include <linux/interconnect.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/platform_device.h>
+#include <linux/of_address.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
 #include <linux/types.h>
@@ -28,8 +29,6 @@ module_param(do_register_algos, bool, 0444);
 
 #define QCE_QUEUE_LENGTH	1
 
-#define QCE_DEFAULT_MEM_BANDWIDTH	393600
-
 static const struct qce_algo_ops *qce_ops[] = {
 #ifdef CONFIG_CRYPTO_DEV_QCE_SKCIPHER
 	&skcipher_ops,
@@ -91,12 +90,7 @@ static int qce_handle_queue(struct qce_device *qce,
 			    struct crypto_async_request *req)
 {
 	struct crypto_async_request *async_req, *backlog;
-	int ret, err;
-
-	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(qce->dev, pm);
-	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
-	if (ret)
-		return ret;
+	int ret = 0, err;
 
 	scoped_guard(mutex, &qce->lock) {
 		if (req)
@@ -120,8 +114,21 @@ static int qce_handle_queue(struct qce_device *qce,
 			crypto_request_complete(backlog, -EINPROGRESS);
 	}
 
+	/*
+	 * Hold the device resumed across that whole window instead of just
+	 * across this function, or autosuspend could gate the engine clocks
+	 * while the DMA is still in flight.
+	 */
+	err = pm_runtime_resume_and_get(qce->dev);
+	if (err) {
+		qce->result = err;
+		schedule_work(&qce->done_work);
+		return ret;
+	}
+
 	err = qce_handle_request(async_req);
 	if (err) {
+		pm_runtime_put_autosuspend(qce->dev);
 		qce->result = err;
 		schedule_work(&qce->done_work);
 	}
@@ -154,6 +161,7 @@ static int qce_async_request_enqueue(struct qce_device *qce,
 
 static void qce_async_request_done(struct qce_device *qce, int ret)
 {
+	pm_runtime_put_autosuspend(qce->dev);
 	qce->result = ret;
 	schedule_work(&qce->done_work);
 }
@@ -194,10 +202,12 @@ static int qce_check_version(struct qce_device *qce)
 	return 0;
 }
 
-static int qce_crypto_probe(struct platform_device *pdev)
+static int qce_crypto_probe(struct auxiliary_device *auxdev,
+			    const struct auxiliary_device_id *id)
 {
-	struct device *dev = &pdev->dev;
+	struct device *dev = &auxdev->dev;
 	struct qce_device *qce;
+	struct resource res;
 	int ret;
 
 	qce = devm_kzalloc(dev, sizeof(*qce), GFP_KERNEL);
@@ -205,13 +215,18 @@ static int qce_crypto_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	qce->dev = dev;
-	platform_set_drvdata(pdev, qce);
+	qce->dma_dev = dev->parent;
+	auxiliary_set_drvdata(auxdev, qce);
+
+	ret = of_address_to_resource(dev->of_node, 0, &res);
+	if (ret)
+		return ret;
 
-	qce->base = devm_platform_ioremap_resource(pdev, 0);
+	qce->base = devm_ioremap_resource(dev, &res);
 	if (IS_ERR(qce->base))
 		return PTR_ERR(qce->base);
 
-	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
+	ret = dma_set_mask_and_coherent(qce->dma_dev, DMA_BIT_MASK(32));
 	if (ret < 0)
 		return ret;
 
@@ -227,10 +242,6 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (IS_ERR(qce->bus))
 		return PTR_ERR(qce->bus);
 
-	qce->mem_path = devm_of_icc_get(dev, "memory");
-	if (IS_ERR(qce->mem_path))
-		return PTR_ERR(qce->mem_path);
-
 	/*
 	 * Enable runtime PM after clocks and ICC path are acquired so that
 	 * the resume callback can enable clocks and apply the ICC bandwidth
@@ -240,7 +251,10 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(dev, pm);
+	pm_runtime_set_autosuspend_delay(dev, 100);
+	pm_runtime_use_autosuspend(dev);
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(dev, pm);
 	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
 	if (ret)
 		return ret;
@@ -269,31 +283,17 @@ static int qce_crypto_probe(struct platform_device *pdev)
 			return ret;
 	}
 
-	/* Configure autosuspend after successful init */
-	pm_runtime_set_autosuspend_delay(dev, 100);
-	pm_runtime_use_autosuspend(dev);
-	pm_runtime_mark_last_busy(dev);
-
 	return 0;
 }
 
 static int qce_runtime_suspend(struct device *dev)
 {
 	struct qce_device *qce = dev_get_drvdata(dev);
-	int ret;
 
 	clk_disable_unprepare(qce->core);
 	clk_disable_unprepare(qce->iface);
 	clk_disable_unprepare(qce->bus);
 
-	ret = icc_set_bw(qce->mem_path, 0, 0);
-	if (ret) {
-		clk_prepare_enable(qce->bus);
-		clk_prepare_enable(qce->iface);
-		clk_prepare_enable(qce->core);
-		return ret;
-	}
-
 	return 0;
 }
 
@@ -302,14 +302,9 @@ static int qce_runtime_resume(struct device *dev)
 	struct qce_device *qce = dev_get_drvdata(dev);
 	int ret;
 
-	ret = icc_set_bw(qce->mem_path, QCE_DEFAULT_MEM_BANDWIDTH,
-			 QCE_DEFAULT_MEM_BANDWIDTH);
-	if (ret)
-		return ret;
-
 	ret = clk_prepare_enable(qce->core);
 	if (ret)
-		goto err_core;
+		return ret;
 
 	ret = clk_prepare_enable(qce->iface);
 	if (ret)
@@ -325,8 +320,7 @@ static int qce_runtime_resume(struct device *dev)
 	clk_disable_unprepare(qce->iface);
 err_iface:
 	clk_disable_unprepare(qce->core);
-err_core:
-	icc_set_bw(qce->mem_path, 0, 0);
+
 	return ret;
 }
 
@@ -335,25 +329,22 @@ static const struct dev_pm_ops qce_crypto_pm_ops = {
 	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
-static const struct of_device_id qce_crypto_of_match[] = {
-	{ .compatible = "qcom,crypto-v5.1", },
-	{ .compatible = "qcom,crypto-v5.4", },
-	{ .compatible = "qcom,qce", },
+static const struct auxiliary_device_id qce_crypto_ids[] = {
+	{ .name = "qce.crypto", },
 	{}
 };
-MODULE_DEVICE_TABLE(of, qce_crypto_of_match);
+MODULE_DEVICE_TABLE(auxiliary, qce_crypto_ids);
 
-static struct platform_driver qce_crypto_driver = {
+static struct auxiliary_driver qce_crypto_driver = {
 	.probe = qce_crypto_probe,
+	.id_table = qce_crypto_ids,
 	.driver = {
-		.name = KBUILD_MODNAME,
-		.of_match_table = qce_crypto_of_match,
+		.name = "qce-crypto",
 		.pm = pm_ptr(&qce_crypto_pm_ops),
 	},
 };
-module_platform_driver(qce_crypto_driver);
+module_auxiliary_driver(qce_crypto_driver);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Qualcomm crypto engine driver");
-MODULE_ALIAS("platform:" KBUILD_MODNAME);
 MODULE_AUTHOR("The Linux Foundation");
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index eb6fa7a8b64a81daf9ad5304a3ae4e5e597a70b8..6eda6e617b811420c0c3cc53988cb15a23abafe2 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -20,6 +20,9 @@
  * @result: result of current transform
  * @base: virtual IO base
  * @dev: pointer to device structure
+ * @dma_dev: pointer to the device to use for DMA mapping calls; this is the
+ *           auxiliary bus device's parent, which is the one that actually
+ *           went through DMA/IOMMU configuration
  * @core: core device clock
  * @iface: interface clock
  * @bus: bus clock
@@ -37,8 +40,8 @@ struct qce_device {
 	int result;
 	void __iomem *base;
 	struct device *dev;
+	struct device *dma_dev;
 	struct clk *core, *iface, *bus;
-	struct icc_path *mem_path;
 	struct qce_dma_data dma;
 	int burst_size;
 	unsigned int pipe_pair_id;
diff --git a/drivers/crypto/qce/sha.c b/drivers/crypto/qce/sha.c
index 738454dd35655a8376bc878444fcc3fbd7535956..3dca00e53e473d3d2f2cf02cf12bdd38e51dc539 100644
--- a/drivers/crypto/qce/sha.c
+++ b/drivers/crypto/qce/sha.c
@@ -48,8 +48,8 @@ static void qce_ahash_done(void *data)
 	if (error)
 		dev_dbg(qce->dev, "ahash dma termination error (%d)\n", error);
 
-	dma_unmap_sg(qce->dev, req->src, rctx->src_nents, DMA_TO_DEVICE);
-	dma_unmap_sg(qce->dev, &rctx->result_sg, 1, DMA_FROM_DEVICE);
+	dma_unmap_sg(qce->dma_dev, req->src, rctx->src_nents, DMA_TO_DEVICE);
+	dma_unmap_sg(qce->dma_dev, &rctx->result_sg, 1, DMA_FROM_DEVICE);
 
 	memcpy(rctx->digest, result->auth_iv, digestsize);
 	if (req->result && rctx->last_blk)
@@ -94,13 +94,13 @@ static int qce_ahash_async_req_handle(struct crypto_async_request *async_req)
 		return rctx->src_nents;
 	}
 
-	ret = dma_map_sg(qce->dev, req->src, rctx->src_nents, DMA_TO_DEVICE);
+	ret = dma_map_sg(qce->dma_dev, req->src, rctx->src_nents, DMA_TO_DEVICE);
 	if (!ret)
 		return -EIO;
 
 	sg_init_one(&rctx->result_sg, qce->dma.result_buf, QCE_RESULT_BUF_SZ);
 
-	ret = dma_map_sg(qce->dev, &rctx->result_sg, 1, DMA_FROM_DEVICE);
+	ret = dma_map_sg(qce->dma_dev, &rctx->result_sg, 1, DMA_FROM_DEVICE);
 	if (!ret) {
 		ret = -EIO;
 		goto error_unmap_src;
@@ -122,9 +122,9 @@ static int qce_ahash_async_req_handle(struct crypto_async_request *async_req)
 error_terminate:
 	qce_dma_terminate_all(&qce->dma);
 error_unmap_dst:
-	dma_unmap_sg(qce->dev, &rctx->result_sg, 1, DMA_FROM_DEVICE);
+	dma_unmap_sg(qce->dma_dev, &rctx->result_sg, 1, DMA_FROM_DEVICE);
 error_unmap_src:
-	dma_unmap_sg(qce->dev, req->src, rctx->src_nents, DMA_TO_DEVICE);
+	dma_unmap_sg(qce->dma_dev, req->src, rctx->src_nents, DMA_TO_DEVICE);
 	return ret;
 }
 
diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index adad399c2026d7cb3057ca4d6a4766276d01e045..178ccc9da7b969401ef854fcae47f0c40ce5ae4a 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -48,8 +48,8 @@ static void qce_skcipher_done(void *data)
 			error);
 
 	if (diff_dst)
-		dma_unmap_sg(qce->dev, rctx->src_sg, rctx->src_nents, dir_src);
-	dma_unmap_sg(qce->dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
+		dma_unmap_sg(qce->dma_dev, rctx->src_sg, rctx->src_nents, dir_src);
+	dma_unmap_sg(qce->dma_dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
 
 	sg_free_table(&rctx->dst_tbl);
 
@@ -132,14 +132,14 @@ qce_skcipher_async_req_handle(struct crypto_async_request *async_req)
 	sg_mark_end(sg);
 	rctx->dst_sg = rctx->dst_tbl.sgl;
 
-	dst_nents = dma_map_sg(qce->dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
+	dst_nents = dma_map_sg(qce->dma_dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
 	if (!dst_nents) {
 		ret = -EIO;
 		goto error_free;
 	}
 
 	if (diff_dst) {
-		src_nents = dma_map_sg(qce->dev, req->src, rctx->src_nents, dir_src);
+		src_nents = dma_map_sg(qce->dma_dev, req->src, rctx->src_nents, dir_src);
 		if (!src_nents) {
 			ret = -EIO;
 			goto error_unmap_dst;
@@ -168,9 +168,9 @@ qce_skcipher_async_req_handle(struct crypto_async_request *async_req)
 	qce_dma_terminate_all(&qce->dma);
 error_unmap_src:
 	if (diff_dst)
-		dma_unmap_sg(qce->dev, req->src, rctx->src_nents, dir_src);
+		dma_unmap_sg(qce->dma_dev, req->src, rctx->src_nents, dir_src);
 error_unmap_dst:
-	dma_unmap_sg(qce->dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
+	dma_unmap_sg(qce->dma_dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
 error_free:
 	sg_free_table(&rctx->dst_tbl);
 	return ret;

-- 
2.47.3


