Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76598C982C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 20:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mIlriSmV1DgQbexuTZLBldyxC5XIABKWFBIiL6gMsIQ=; b=ynOqph6socyKuH
	SHWy26dpBDQgVvPSTy9NeGWpm/JkQs8M4rmIys+x3Y8kD/+nJXKkXRDmg53tSLIHtVbD4dSgLMxo5
	gzNDiDqinr1yuC2cmc/Dr6oExg8NWuxJsvEE3K7QGnydi2eiorC5Wr1Ox7RDUwKZyL/xAmjzTf1iJ
	OANcB0sjFlMyhuHZngYBMG9L4YUALGfwOkYEeSt+fMusoielJY8iQiIrHV+14kTvU1lyhguq5D42X
	9wiL0q6yf5g/BJBEYSeaqt0KaMI929RKc+fnWk+hk/ELdbtZeD9MGfFFrk1H+/ykQQfrdMgE0DZ6X
	lVJtalana9OBgJYIeM6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wWi-0000000A5r7-42hO;
	Wed, 16 Sep 2026 20:46:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wWg-0000000A5qA-2EEW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 20:46:43 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFeeNn2600748
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 20:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mIlriSmV1DgQbexuTZLBld
	yxC5XIABKWFBIiL6gMsIQ=; b=eK39a+JcprCVu6UAbvjtPROoHsVl5M1VX5sSys
	LIjedqcObH2bqvvKEhUk5I0s860GLy17kpQyCtXxXeUZxcYxeGYlU0qNUEA0FWNa
	e2E8iMFjoWKOEf6zk5CvPEi41HWHuaCh+coFHIaJm5qcTuIXjYC+gIIsFp7Ua9Y7
	hoVKEGzmSKg+oC826bGGmCqzkamgF6/pYLfHBl2Ox/6JI7u25Z+NJe4npSvxiCCa
	5lmFKhoGc5sxmxhu0KSVwAFIT97TAu1bSoP4Ds2VoddGMoQ5W6cz0A+rDrHYNhib
	R0f0fqa6rnw6J/Vnu4maQr3QBEdocA7bx0c1uQzXYsa/3RTA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gquwb21w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 20:46:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a00c70d28so23056385a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 13:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789591601; x=1790196401; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mIlriSmV1DgQbexuTZLBldyxC5XIABKWFBIiL6gMsIQ=;
        b=TsR5IIyDdNbXqdiyrqlLnRJZQSVWmPFWHdRcjBHKQzQfIl7fSmYkSG+YZXls4lkXhk
         tpT5Wzy57TGlrixjapjdnLEs3+Zh91y22xffYyIq5+SV6IvLDk8ybxoIhrq1FdHnRSS9
         zx3Nf63JQLvcYFR28CI5XHqXKr+NxZEgoBnN6umzE0ZLpAZ/PCk8/9VgHes+nmuONliA
         Ld0U14CEWxJXETweqnDqf2NYOBkAGf15SLgZPc33zpi9t5hHYtQJ4YJ20+FV+lIzWbxX
         4BjSzWrqruSCZyB6GFA4+XDuxNZcNRzZtCIaVBizelWb3S4aANczj9Nb9cC3yJ/PUM7E
         dGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789591601; x=1790196401;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mIlriSmV1DgQbexuTZLBldyxC5XIABKWFBIiL6gMsIQ=;
        b=FEfJloQ1/+PE4LlHipf7dMjbJAn2iV0EdmXKg9aYyXO63VblsWIaBJRjTXY1JadJ0b
         efzi4G1nqzTeXHezJYbHhNPE2R0nnvmTYEI2cuH71qXiZ7DvIid9a0vDpHZn6OYyNY4x
         idtWE2gPyc4B/M/H5dddPwoivGlJyRKUICHEpJh9gMPGo8hJHci8CYeZ0FPJGVphHRml
         LWAlLZr0pIpD10cPswnN70p7XH7hElVj0xYSx9oJiNlCkoCl3EQoDHBLkLodBkcsABi/
         F0geq0eyBE0O0G9e3fxS6ejjaYGROt68QMFRwyyevsE7d7NvMT7lyO4hTstIKx5wZEgb
         hFyQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1tHwncpg1azuo8jwN5xgmgE2Q0D0in+riWZc03o9wj94bEEinQEXnquL+X5KtAw/XvXpWl2kjCVdUs4X2YOaO@lists.infradead.org
X-Gm-Message-State: AFuF++nwx9Z20EYwuKHCOobK2R6P7wtt2Gxv6BeY7WL6U7HZaNkHJiGz
	w88zyPhZZp16dg3rQuNIQ4MebTuQAT2TlXO55vYrVGH5eXhHsX53IyuDRtUjOWt1B5qlZMpgn4A
	ShkIRzsT+RjREX/BwFdyPEQVbg84yQBAbcupEnSWujRpeUVqLBVBYmJhDalf8QtNlQTRpu/N5F2
	RFWTDZLuNpEw==
X-Gm-Gg: AYBFou3IarDN2E9RYJNXHhJbENNfIl+Ou4s2qQnrje64vrNnzM8rlM4V75dHjMqaSrm
	fzlIumRhMtvALB4Q5YAF/Ka1MgBb1O2qgn1MF8I2o5EizIu2wKjAfz0DFuLuUGdF/B8Y9kYY/MO
	UpGxHe7WaBfR9XKIbn/lNLOsoI/zn/jhLDgbfUkh8epIX5gJuQMeZpAIFjRBN1Znb8JDIoEYu9P
	nojgirMaTqHh+c77WV+aI4D7JRQPF2Vt1JsfmIfnNWMD1+HyTFy//nosmsP0belQElWrfni+wcT
	sev0XUU8oElmD9VxymrBQxTj0wBsSBp7K2EE2EWlaQiB44j2HP5FzgS3QNISuXpB3eFR9cgcLJj
	MRMf/2VA7nECE5rFQL5LWO9c=
X-Received: by 2002:a05:620a:4512:b0:939:13a7:70f0 with SMTP id af79cd13be357-93bb770c2a0mr672321185a.5.1789591600737;
        Wed, 16 Sep 2026 13:46:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4512:b0:939:13a7:70f0 with SMTP id af79cd13be357-93bb770c2a0mr672316185a.5.1789591600265;
        Wed, 16 Sep 2026 13:46:40 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1fa7dsm9857077f8f.8.2026.09.16.13.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 13:46:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/3] dtc: dt-check-style: Introduce way to disable checks
Date: Wed, 16 Sep 2026 22:46:31 +0200
Message-Id: <20260916-b4-dts-style-checker-suppress-v1-0-81b86685d068@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBBFr0K6dhIwtQJXMSzoMEgVCnYKwRDub
 hESNy7fz897i2Byhljk0SIcTYZNbwMkp0hgU9o7gakCi3N8VnGWKNASKs/A/t0SYEP4JAc8DoM
 jZqiR0jq5YqakEsER1trMX/+t2JlH/SD0m/R4OHqNIez326+bR3s1zv5Xsbfe2JEqaI0lBlRpd
 tEl6lTF+SQ3uy45/PuuMz6PLM0eDqUUxbp+AMLP20f+AAAA
X-Change-ID: 20260916-b4-dts-style-checker-suppress-fce8f17c9646
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3538;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=boA/geLpFUCqZyUNKsjxk/G3/OJ1tuk4ldtRMf08Nio=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqwAqiOLoAQ4VKosBMUlrkktYK2o90/FbCSWkK
 A/Tcwe5c8KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqsAKgAKCRDBN2bmhouD
 1zzSD/9/DhsLnHDk2W22J6HrGdMSypIsRat+8WK/qTFbWJCUIxWuxanIeJuUa0HVREjBB+jBqYt
 Tj/PuIe4lLsyQkfWDotzkALGv+Jfp+PUqlzZPnNXaz63SgdeO8pRrmhtjcjoXsh/gVMbaDRRRab
 gmKJS3NXhpOaFzZzXLxRwxJ6lEjO6b8ALaokJdE/0HFFgLwHCYkudJX0qfCOfB6ryx2gC11zI81
 +BGnwLrAqoiDTqh1O0zzSe3BwRm54QY3Sl0ayYeWuQYi/Hm+uoAzaTOcD7PGzXQ6PKEwGV3sfdp
 bEqEf3ZGr1kaSkghLxOMEQa8XFSjvGmzAZpWWLjPr9I9C08ClJmU+6Q2TLyV47cqxQAgXsdsQrw
 HNza7uHlZqRQssvkRtHdrAYlslb2dA63I0+ON3L+Gza0cQWO+n2Rlz2kzevVgLeF8QYjloOq229
 GKG/r93vI0wDinAtW49wMlBfAoBHm95OGVUmsPLk46vr5kuw0kWPOvXGRIMswvYVFgIhKsqRF4W
 RA+A+EDREryOGFMp4Nb4I5kIbCCEH2H4Jg6hSr0ENEI4xo6GI9z3Knd0c74CV7djF2suiDkce1y
 9nhH+eC701WagnmFTxpGxnA1ESYclsW3GI38iWejHKPU8fSxas93Ar66ztiVGzk2MUTrHRA8Txf
 Flt/6wqNmorz63g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=H4JOUOYi c=1 sm=1 tr=0 ts=6aab0031 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=KBJGa0VgAPS7pA67L9gA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: QP9DtHS4bI2o2oXqSl6W5imyBOyp7JlX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDI4OCBTYWx0ZWRfXzjWJ7d7HF1jw
 DRfF0PnGoKyyz4lSLeQSCMz0aJqvyD6j3wl0DbqThamVbLSGz1FKfnL9qTJToF5vEuz9p84NL4U
 2+/VOFSS8/xsGS6oFeqncajtnToT7/kipF2DoScGnUxkiazbjkawzgXhalD9RnLZfqvlsFq9fYC
 m1gEQl1Xc8qMleEFwgZazWZjttx4NQYzW7khIPZ0nDzFSm/d8ys73bKGximHJzcQQPhUMkENa6p
 gAJRPaSFYEi+lJdP0n1dP9uH2t/fFSZ2FMHNohxY9lze5UHYkz28sfaPpn1MLrZDy3kHSkX+q8N
 DNzClx4Vlm/bKMgqz4/uXnbZ8ZcdfuGdYBymiwMJl+uTDyaOyHF7fCWOcKwq9+FpsI4wsfyqrIw
 jgVch65gBGuBzf96p1R0uvjXg/e1Hn2xgvDqJV/bFeSY1wkl6K2XY/vbg96fFUIdb3Xn/NdSrp7
 lEOaukFZsBRWzoQZSsw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDI4OCBTYWx0ZWRfX0kuG2w3xbI1/
 3IXHqvvpjX2aNkraKQZMfYJXtqi0pqZqZaocglIbiVLQaQlxeBkkmzxgd2XFfYKS+8o7tyrY9lq
 FYPr/VPHi92Lo+J8HOyMxf7Ff3ojz9k=
X-Proofpoint-ORIG-GUID: QP9DtHS4bI2o2oXqSl6W5imyBOyp7JlX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160288
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_134642_577241_0561EEA4 
X-CRM114-Status: GOOD (  11.79  )
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

dt-style-check patch depends on (context/rebased):
https://patch.msgid.link/20260915-b4-dts-style-checker-continued-lines-v4-0-5b8e09b11ef2@oss.qualcomm.com

Some style violations are okay to have, because it allows to keep the
code still readable while reaching full dt-style-check compliance.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      dtc: dt-check-style: Introduce way to disable checks
      arm64: dts: qcom: Suppress a few intentional redundant whitespaces
      arm64: dts: exynos5433: Suppress a few intentional redundant whitespaces

 arch/arm64/boot/dts/exynos/exynos5433.dtsi         |  4 +
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi     |  6 ++
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  4 +
 scripts/dtc/dt-check-style                         | 97 +++++++++++++++++++++-
 scripts/dtc/dt-style-selftest/bad/dts-suppress.dts | 52 ++++++++++++
 .../expected/dts-suppress.dts.txt                  |  8 ++
 .../dt-style-selftest/good/dts-suppress-file.dts   | 51 ++++++++++++
 .../good/dts-suppress-nodes-properties.dts         | 49 +++++++++++
 8 files changed, 270 insertions(+), 1 deletion(-)
---
base-commit: 2b74cbd61ba866a42f7274bbaca27d59998bdd2b
change-id: 20260916-b4-dts-style-checker-suppress-fce8f17c9646
prerequisite-change-id: 20260909-b4-dts-style-checker-continued-lines-c6895bacb860:v4
prerequisite-patch-id: ac163f170b5b1cfd4170c8fd80b2500377ddb069
prerequisite-patch-id: f470296bdeae881ecc7308e31ea90da0a4b08c52
prerequisite-patch-id: b28b0bf1f1204f861d6e3449d847596c3aa5395f
prerequisite-patch-id: 11247384a57609f071969af426828de6a9b03b1a
prerequisite-patch-id: 95657765f7c99843225fb476b09e9975648a1eb0
prerequisite-patch-id: 8a18d3b03ee753933aef2cac631d3578c2985bd9
prerequisite-patch-id: ef954ae6784ad867e286a64285ed7cae0d62701c
prerequisite-patch-id: c1d5b94ec03e9790bdb245425cbb7144e25ed946
prerequisite-patch-id: 6a7e87d62a887d8bdfda00d379a45ae4c3a88f70
prerequisite-patch-id: 6ecfe2c2e6d3414852049bf184923eb52c8c094f
prerequisite-patch-id: 6fd9f568de9ae35050d90202f7c4ceba9a33f70f
prerequisite-patch-id: d62f7bde6bb1db9655a7969a3692ef098fb3970b
prerequisite-patch-id: 10cc4f931221e5c9c0d3810789b7c677d75417ea
prerequisite-patch-id: f1f6a75fd262291c2d1db0ae7040067c67e08957
prerequisite-patch-id: 613548bf804a4984b202ff69aef258ae327653af
prerequisite-patch-id: b016f9065366d98a39008b4dbfab9a7bcf421da2
prerequisite-patch-id: da84335c3cc8e3fa644ce97e6bcbcf2927e69489
prerequisite-patch-id: 2acaa10ee24a9217a6fa6756473cee3edb085e69
prerequisite-patch-id: d0f34708ce430403cc3403441fba1916edfcb6de
prerequisite-patch-id: 9c4f6161055f697ec1d633cc61e6748c070957bc
prerequisite-patch-id: 3536b2b9f72344868ddece77a48446af0164f53b
prerequisite-patch-id: aade8bf06cfca120500eac3447151ba0a0ffb192
prerequisite-patch-id: 0bb85efe9f0efd7a990cbc524d6360235bbe68a3
prerequisite-patch-id: 07a4da083ce7916285d80de33f989b499c78582c
prerequisite-patch-id: 46309bf89c926711a1f97ceea206e1b733e5e206
prerequisite-patch-id: 14fa558b453aaf560eb17d163500a433e38890bf
prerequisite-patch-id: f8ccd89f399b61ec1dc867ec7955a009c8c7b694
prerequisite-patch-id: 833114edb0c81877ed1182563426ba9695b81081
prerequisite-patch-id: 2ee62b9fd3ca36941fa9191b55136afb2bd699ed
prerequisite-patch-id: 464e2f568391edd2c3a39ea0d8920756a19e3159
prerequisite-patch-id: 0ddb7cb6bf6ba3503500ba8735ef77169a403edf
prerequisite-patch-id: e11ed37bd232ccae179a6ea75391f3dc52864ea4

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


