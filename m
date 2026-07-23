Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643C3C531C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 08:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MmAcu1RFLDltkgsIHTPtmbo1LCphZ7iKioCVFV/glhc=; b=Ww96j8O3zvNmzX
	hI3DZ3LgvNJZQXIDCqa32NE3Gm/zFSqoR6E6yjMmTuDuwoOxMCQG1+5nEgNpXWj1/dGV+s6NYR/NE
	9L8sT84Gr7XKQQ814BUlydJ9xm5kzvB/eqz0sD00rdrtl+4SuR9ep0TNaQpqyfEBiXE9zgxQ0AWW0
	LaZA+VR1g0HaD4o0o1/exiRBx11Xyj1FZl8zKHpwseIst8OASNQR1WCiNjlO5IgbAfis2xfSnvZHZ
	tOn9+2g7AlLsxmncf7bdC8oTC2MFEDXq6Fn/uP+rIkDJG0pmDD7YZXpmwniWHH8vaiCC4zs4zfTe5
	4YQOeXm0uS4FRWiw6m7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmolX-0000000Dj49-2nqF;
	Thu, 23 Jul 2026 08:26:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmolV-0000000Dj3K-1xXH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 08:26:50 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N7jZrr2892878
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 08:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MmAcu1RFLDltkgsIHTPtmb
	o1LCphZ7iKioCVFV/glhc=; b=KLeqsqgPrxkbaqPJqsrbaGzdkZ4BgSEw6ZZktM
	tBZqZiCPoBL7KDO5bKOvZ790ezwKOqpmq1zbmpdTuyhomjyklWlwmR0CfONk3Zl/
	i1Qd60lTBTWZKxc19+cpSA0T/suVK45k5i+hYfyd8PD2PvNyKxO41Dek/wJBDxjU
	/x1WePoU+DhpH8ILY+m3tzs/ttpYXE+Ups1BZyf0iPrl9hYfIcpDezGbWIRFOiu3
	sHWWsJ7gRZaTkYFsRunAGhOeA4nAW3m/2F35VoPazKHr36nocSMA1jqRA5WfwK2e
	YSUPVX/l3DKV4R3uH+q+adc/YvrApLse4w/KOhkQMOpHP8Hw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkeuq84su-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 08:26:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e2237bc43so1011313a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 01:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784795208; x=1785400008; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MmAcu1RFLDltkgsIHTPtmbo1LCphZ7iKioCVFV/glhc=;
        b=ITCTeMXm9p5S2nqM6FVO21uPujTr7GajreNBVI4rS0R/ciKbFfG4TnQXJup7Ej3wir
         KDwgcpz3KJ0+wVJ5n9zRMFNCYgseAOZ3+3DLzSz1hlntvT1d2NshQvBHm0PhlLms9xX8
         uhQcH8rDc6GrggOCv61NM7ZnGGZ8fftULcx9PRNCp//wyFHW47Quj814HlIm889lvAgH
         uH5S/BOwz42yDksx1qtF/B2RmRG2F2O/eFzIDyzbHTrWH6RLL6PgmULGGYCYN59/Hrrz
         KN5YiwDg0UO9CHtgXb4WnGOLF6VNdMY94Ra4kKwsI/RglduBHWhPdRvfU18Yl734Q0AT
         26Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784795208; x=1785400008;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MmAcu1RFLDltkgsIHTPtmbo1LCphZ7iKioCVFV/glhc=;
        b=eBRTNrlw9+I1BHz5dOUUtaxPSNxGcOZqrsWMDd7nvZUbKkQ6I5aOIwNQeiMvHQMsix
         tD5SucK8pMLvNKQ8hgBpMo0nYZ+2YcgmeJW9D3hh7rMogZ/CwvnELpYbqXeqBFeYiuGb
         iNdjytSSz+QDyPozdZiH1d9XZvyaihM14zFg38lAcYp2G84z76hr/Ogg1PlmUzLhHGJB
         3S4qwIR4VVnMl3fmZ3vb1Leo7vo0Pf9V38q2nGnpDTbv6mxyx0VVPwsR4pQJUhnEE70F
         vvfGFFqrFAikF6D7mfwMzBfbez3loIrxfzE986yLyV1xpq5t46fw1gqQ6HtJmSZDRCkQ
         OdCw==
X-Forwarded-Encrypted: i=1; AHgh+Rof9AzC+0dNTg9yxzkj8uzQNda6MGs2agq3gpu9wyI2pIzatRyk9vHZyxKBIQNpPuYxG2aebVrEsCBABdE0wQ0W@lists.infradead.org
X-Gm-Message-State: AOJu0YzTqEU8X2854KRCV1mxattzK4qDJJ9CRITyZYaIVaeQQDNTDn2t
	oohc0nWpUDtZVhbGUUJgZnVuGmoEQK5oyb+lfpUl/bb7izNlLLtFIcFsDW0RAivFWwOmX1opvJH
	+KXe7sK8pQk850DdhGKo2J9Dxg8ZXtzOwRPMzsfcblqkn8w11z94ST9lmncQ87txTiaWx5XgWf9
	cpRQ==
X-Gm-Gg: AR+sD13B549fItLJH8JEI8mYDMT1JFsm/J/oK2GnImpmGflg18wu+g1aKwtq6ACE9yt
	Pe9cB8khZsePM47sue1iq0KvAoOtt3ojM8K5DjNf6h9irC9CBHlqIA2cvLR034MhwYTgrJ7eqym
	RGaq85iLzT899u2BBWKnyfaN4CITmYPTV9BgIFqfh5It5wKVAyOgVCAmZhne66sFj0Yreben1fq
	XhB3KrUpXKmGIw20dYbvFaIfC9iExLgIqj3jV20is2dujiUvo577Wd1uu7Px7GM30E/rt13xiko
	zRMu0P8trzzv5SA6uwejFBDoNtJhnvG7Ceb/JreODoQGjhGAxLVDaNHa5kc6WLNx+aKd9fAhw1M
	h0k6f0Rtr/lumtAk9yfhGbg8lDHq3VZwkXwKT/54l6NVH3cL555xrTlLO7usjkQg=
X-Received: by 2002:a17:90b:39a3:b0:36d:689a:cb27 with SMTP id 98e67ed59e1d1-38ec66113a0mr2059324a91.24.1784795208107;
        Thu, 23 Jul 2026 01:26:48 -0700 (PDT)
X-Received: by 2002:a17:90b:39a3:b0:36d:689a:cb27 with SMTP id 98e67ed59e1d1-38ec66113a0mr2059297a91.24.1784795207654;
        Thu, 23 Jul 2026 01:26:47 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38ea598f67bsm1427988a91.3.2026.07.23.01.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 01:26:47 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v5 0/2] Add CoreSight nodes for Qualcomm Shikra SoC
Date: Thu, 23 Jul 2026 16:26:29 +0800
Message-Id: <20260723-add-coresight-nodes-for-shikra-v5-0-fd5494471b36@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADbQYWoC/4WNQQ6CMBBFr0K6dkhbLIor72FYFDrQiUK1g0RDu
 LuVxLWbn7y/eG8RjJGQxSlbRMSZmMKYwOwy0Xo79gjkEgstdSkPWoN1DtoQkan3E4zBIUMXIrC
 na7RguuZo942RhVMiSe4RO3ptgUud2BNPIb633qy+709d/FPPCiRUlS6V6Sq0ypwDc/542lsbh
 iFPI+p1XT/QEUlR0wAAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784795201; l=1945;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=MOchWqzaakPoYge9h/NHI4gz2lgR0ESiXhWS1Ls/prI=;
 b=sfxIuZNqm3Bpqd1nqDWD1pzZTWpo3Wb9YX8UlpZzkAQGebha07Vq+0uXOc2Qqr19fpmDtOE0I
 IIZsDUfhuM2CqaglN96K+ht6QraxZpeGEnGwvHxm94Z94mV0S+9pBLd
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA4NCBTYWx0ZWRfXxLyt9o52hlK4
 Z8p3l7yDLRLUY/wO9x/uHVwOtCBcbwBfnNvLcAbh/f2AjLydtRiO6oVjfTQKyqC2d4BclRW18o+
 h+/mXoY7M7b5UKzXir5rD5pdEVGfCEc=
X-Proofpoint-ORIG-GUID: 09hz-_YlSFRT8ziDeO5KIzdDUU6yk83n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA4NCBTYWx0ZWRfX00/j9R9508/a
 UQYyhRyghDD+CV16v2PSCvXzU9wtwIWIiPPk4kLFYz45YcR1nEbORw+ltl39LatudQogGIl5jhO
 7Jv//6/OqWiCYcUSpif/Vk4nZasnDOfZFAK4Pjn+uJy7pyJRnNCKQ8Nh1XkfdaiB4Gaz0pQ751N
 BovOH2G9fhItYQpKZP2rP3FYR0KC2IZapXiC2iThRk9v/4owwNxwcjqRdhRkYK13RXEqbYWFcpl
 Lul6FCtx/LP6SYeuIQMjfAM8l2ELJZbf0ymsT2iSh1S9XMyHZnmvsPts62RUlQHFR/HX/YuS6ft
 X03zr6g6CvsdMvy3ggNlj6g4UixK5XJlKCeya79zNy6ykcPmaPNxxYPtS1BEw91NtQ7296N57qy
 2UzMNtG1RoZfUEy+L01ZAl9WODCgbYINyoKWw7ElwPMZr3T3zc0faz5wnvqrMxrHb2ZgD19yAFC
 tWWE7cla6ngo7YIpEpA==
X-Authority-Analysis: v=2.4 cv=cPDQdFeN c=1 sm=1 tr=0 ts=6a61d048 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8s71dIhK7fIjNjj6m3AA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 09hz-_YlSFRT8ziDeO5KIzdDUU6yk83n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_012649_517146_28207FED 
X-CRM114-Status: GOOD (  14.13  )
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

This series adds the CoreSight debug and trace subsystem for the
Qualcomm Shikra SoC.

The first patch adds a fallback compatible for the Shikra CTCU (CoreSight
Trace Control Unit). The CTCU on Shikra shares the same configuration as
the one on SA8775p, so "qcom,shikra-ctcu" falls back to the existing
"qcom,sa8775p-ctcu" compatible.

The second patch adds the DT nodes describing the CoreSight topology on
Shikra, including the funnels, replicators, TMC sinks (ETR/ETF), STM,
per-core ETMs, CTIs, and the TPDM/TPDA trace collection blocks, along
with the CTCU and the dummy source/sink endpoints that model external
trace sources and the EUD sink.

---
Changes in v5:
- fix the incorrect version number: v1->v5
- Link to v4: https://lore.kernel.org/all/20260723-add-coresight-nodes-for-shikra-v1-0-992615f9ea15@oss.qualcomm.com/

Changes in v4:
- fix the wrong subject for the dt-binding patch
- Link to v3: https://lore.kernel.org/all/20260722-add-coresight-nodes-for-shikra-v3-0-1400a3454e9f@oss.qualcomm.com/

Changes in v3:
- add correct subsystem prefix in dt-binding subject.
- Link to v2: https://lore.kernel.org/r/20260715-add-coresight-nodes-for-shikra-v2-0-ebd485e39a51@oss.qualcomm.com

Changes in v2:
- remove MMIO for the ETM devices.
- Link to v1: https://lore.kernel.org/r/20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

---
Jie Gan (2):
      dt-bindings: arm: qcom,coresight-ctcu: Add Shikra
      arm64: dts: qcom: shikra: Add coresight nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml          |    1 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 1295 ++++++++++++++++++++
 2 files changed, 1296 insertions(+)
---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260722-add-coresight-nodes-for-shikra-5fb8a4b503d1

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


