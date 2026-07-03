Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0583C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 10:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jH9XKM65dlZOUTQA8la8fi9KMsEB9L8o8GY8c7eRgV0=; b=E4F5nrRR/jeJGC
	7qvlfs3Hrrvz2fN5yVg4hQJDs5yLsTxFgu3ZCS61cEB+7Ud7mYpink24TYRsooLUauOvrqmyUs4je
	j0XcbPeBP/uaPteQuFwFmHKZwB+OYAtwDZ/1mD3iD//VXYgomd/QOoNHmx+a1BBu9WVLNOREz/A8f
	iKM2435jwhLRBDbHEk92TGbFekZ8A5ekqiUyZ8vM+8lPExdVhXXXO1aqYkeSHzELavRQrSpBET+4f
	+QRTlP69Fkc1go2XmPnMxdmeszoVphCrPLpy2Du1+ndk4HrKDwbb4puU6AZ59OOjbf9vRwr5Nn3X3
	TFyyEuVzreFwtTCKxZxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfakv-00000006XiR-1HrG;
	Fri, 03 Jul 2026 10:04:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfakr-00000006Xfm-3Qve
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 10:04:19 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663A34w73773376
	for <linux-arm-kernel@lists.infradead.org>; Fri, 3 Jul 2026 10:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jH9XKM65dlZOUTQA8la8fi
	9KMsEB9L8o8GY8c7eRgV0=; b=hFT0SbzEv3vH0TT4wB1je6oeNEF6ncBNwNkH1s
	/s0fdXatwjyf+tX/OaARnsK/0yDeFzKsp7nFN1DS+ZJHa1PcXcCUtiaLWxuQkaSa
	TvoME2kgLiGv57N/vH4r3yiMNHX2WVCWIU8uKtMHPXWgkjqWs8wM5vu3JI75Vg2n
	wZGZCOsTTnifAgA4qPVSqW9fEyTXupDhCXG4/SgAE1HihsXpauycxtB3I4diC8H/
	fkM67tMeJ3Gio3S9qhUX1KRY2VHTLtHBUzTfRHuDFqAtgkle4ZtArjGR+TM5kS6I
	ThyaIXKdwbxqgse3nUcKr25HlO5ixYvI5oDaV2kfWA4614fg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6b038062-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 10:04:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92d1cae5939so38038885a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 03:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783073055; x=1783677855; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jH9XKM65dlZOUTQA8la8fi9KMsEB9L8o8GY8c7eRgV0=;
        b=kMzgmRoQSGm8g0Z3mgpm26hxTfjSC+qx3nNMY2g0ntOFXhVmqYiX1TszcCbCJTz/I3
         ZMbxwOaTiaQh8qLRlqayXFSs+LZbqQLYWgUC8ft0cTs7Jm3NFtWAadjkNLaTaJUtIHEd
         fzy2qd5LrtljdcVK6RZMMBk1Ja4bNlalQ3UPw76OezjI9VG0sz5b5pMf7hbX29OxRG7a
         RfwNj5MTmR4XFDB6rEvQI/vfVCC6eOU2TOMdDrHdwl3jlzMMiOglC099fJJ3AQoS41TU
         mVGWNxhsJGRBcmAwsYJYzseFcIhe5Y6+O4ha+A+iEenbejp/RPJuRDXSXGG5LFldIrPu
         LrMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783073055; x=1783677855;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jH9XKM65dlZOUTQA8la8fi9KMsEB9L8o8GY8c7eRgV0=;
        b=K53ogjQexqykd0GJPguHZqembLOPrEpB7fqehsZHxLCXYTL142tCLULxkkg80Ys56J
         FvI+/aU7xtUFH6jVD9USvTRFlpyL/cjCmsGiTSkC4To5mVSHpl0JmaCWIRQZh2UW/Ceo
         Roalc1uj5xiR/WT2cJtKujeb9dQ2eUQNLlPRgLvd9lfiDCh7qXovUu2/Agwm+eBcWbOz
         ROpRR8zImgAbfSF10r/Dah+CzZmHrQUDZRPfwcNIoETZLv1HRuVA6XwCyLia8iXTVbud
         6EAkFfMn68pLn1sHxWd1yUUie34luuyWvmvlWYneV9tXLFTjJWROcUoGjAxhuhpkhz9A
         NZOQ==
X-Forwarded-Encrypted: i=1; AFNElJ+qkz4CzKTX/uqjuBGVN5wD0thb53AGAvI+emhvM+/LfYmwjkmnq/oDiigJWiJP1Ub0gAizYBrchSUymNY4JyMN@lists.infradead.org
X-Gm-Message-State: AOJu0YxsjCCGYubaCpYe3bHnHLDjGPPWOUK+XvFZiN/q9R9UVJnLYvv5
	rE4eTvExyTr6134RDHkZNHl7Evpo6pM/3650i67Au5NcF3yDRlnknCD7qzTMsPAYiDaqdHmq3+t
	uGOc6R6+h2lj1G8QwQv1RRkNJS/jy9VpOu253Qy5FrIRhX9i35ZfsWIRWCcfRLY2S2dRDO4iydt
	F2iQ==
X-Gm-Gg: AfdE7cmbYzRdZmXb9Ga4AJEinKiHrZsesRlCvYiMsswNrZSmeAwYynxQanApriwUaxA
	MzsredEZv5AOOPQKlF06AEgTDi9SY3fHurAZ8d+Zy0Ouj9o4GUYyv4rStfDfSxoBfM8YGMYlFJc
	2oyupgwPE/Cs6m0d67SzbwCvXKq9gekPlvoGMUWZaqhFdOyR7dH1l0iaRhxVOW6wvAAvYtcn7mq
	co+d5uyAo+TTmy9onD/DW6xwB0Zx1x0TC1qkbGk1PkNVn8n1hcZPQ4Wk4WyvOwSTiS3wmdjfUdN
	xJGGZlXtR8c4Inq0pAxdq2b7P2LXDx2/EhzMTUkViyFV/H4MkNuiOW7T/8I8RLaaWHsqOql1WMH
	68kpbY0+KxmIJn+BxRuMuocKDnPwUaCokSyg=
X-Received: by 2002:a05:620a:284c:b0:92a:f65e:1e95 with SMTP id af79cd13be357-92e7825b261mr1240736985a.21.1783073055084;
        Fri, 03 Jul 2026 03:04:15 -0700 (PDT)
X-Received: by 2002:a05:620a:284c:b0:92a:f65e:1e95 with SMTP id af79cd13be357-92e7825b261mr1240729285a.21.1783073054365;
        Fri, 03 Jul 2026 03:04:14 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccd9d607sm51353505e9.2.2026.07.03.03.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 03:04:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 0/7] clk: qcom: Add sane defaults and drop defconfig
Date: Fri, 03 Jul 2026 12:03:58 +0200
Message-Id: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQ6CMBAF0KuQri1pKxRw5T2MC5hOpQpUKBAN4
 e62uHBD3Ezykz/vL8ThYNCRU7SQAWfjjO18OB4iAnXZ3ZAa5TMRTEiWcEmhedAebEsV6nJqRkd
 zyFWRSl0xUMT/PQfU5rWZl+s3u6m6I4wBCo3auNEO72105qH3z585ZTTNCsxSSEBjerbOxf1UN
 r7Wxv6QMDOLHyRZsQcJDzGQGTCpoOR8B1rX9QPAQexWFAEAAA==
X-Change-ID: 20260416-clk-qcom-defaults-8c8d956fb0cd
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2164;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ge9oc4vb+i32Zwii1RdJnAu1twKM4C3P0N5lboaUfjU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqR4kTqBNgJ81BCLmAPpIsG1hyn6Gfbn5viQE0f
 zKZZayrliKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakeJEwAKCRDBN2bmhouD
 15MwD/9Yj2Z1tJge6THq+IAa7UeH4D1U8Z/wDjzxdquLZk+pE173+UnEypB02kKeIfTyJStVb9E
 GllXHUxajhT5E39z3xNDID2QrH17c+J5k2loddHZzg4tnxGN8/Yjpyo5/xUuxCRWoBkP0pWz8sW
 l+djxepWEG7kR9UNgon2groHz8E1yV/k7PPdQmT+xDnGdwdrf5ZtkEqGjuYpOekEp/rXsJnG6qo
 Bwu4fft7o+up7XRHLl2TMFlF0T69UEUkksoXNOQvy50/nVA+Ink/6kuWn5LkK8HTKND3SGDJBBI
 7Ctu1o9EvbKJjmFBMosOEUJ8/ZTfzPNiTkeQziZ7vT5nuMTDQAVTQaxWWiyvt0rLT/tG1Zi4Cj/
 wwUMtdAVGoDEYBG5Yrp0JNWLNzH2UdZZ27gAAfEsw8z6aUnIccp/G/AzAdX04ZbeLatBp7m2Uh4
 4NF+TT4bgqCkwMui96zEB1G+Ig9oAShxHetbs58YeitSHm0N2CJFT5I7H0r/y4c73LZL3N0AktK
 iSIxFjO5TOOa2Ouy1Il8oA0D6/rbFwxWpNEZiPIZSyOvYkNpyhOettD67lh7oydJvpeVBbMXUtK
 nKuGqmYZa5kBKdJFVr+J5UqYpx93Nse2dPCGmd6eVDxo+jnOWKhMMLRKbUfeGP1aSh03VJn0A2G
 S0yq66gRRNJJUgQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA5NiBTYWx0ZWRfX4obsycBiIRpS
 c94ZOWvfFH9oTld3PEURcq/BhqWbGSEGaZku9tCp2dOPSBN9sx4WwGbZxmMg6uKuMZOspSDhKJw
 z57PzaZDjMeRsx0VLGJyMPui90k0ZFY=
X-Proofpoint-GUID: OQF5b_g3wqdC74T1DaGDBgVLye9jZeBi
X-Authority-Analysis: v=2.4 cv=FoY1OWrq c=1 sm=1 tr=0 ts=6a47891f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=TT7kfrB5TxoYu55ZGY8A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA5NiBTYWx0ZWRfX1kcZPXT1qO9M
 WdhNaqM2kuBtJ7Evz1Gf/lZcYRGizqf06x1HjqzSr1GZ644lwM6KSb64UwlDlsF4mZxTcLiNG81
 fMkD94d4xdQxcP87Z7z/0tOZm9x1Zu9FUEux1gFy9IIGgML4NczZTZ+f1Ee5+ECul71jban3L3J
 bcBAbwJUkZQauRv4sZb7zXBJPRiWeur7woWTvp3pOsuakdQk9PUK8tMY0HG8GOZ+slT/Mg21OVT
 fsqLLVfwAWeL27zcvr3QtRWVu6/0jyF6cRctVgT/gM9qBsAm2taWncVeJ3M3CNZxhj/f9JyUuvI
 g3n5CwfdgNnT8YDnRGU8DT7oSV733B/JdNDga1BzkP1wtgnSYNINYBVzGzEJ2oGHY5m6yACYflY
 2fmFZkiGBaBMR1vg3KLjjqhpTYS0KGqitjppamcFnF6THWktkhhl6Gi2JxTpPLCsJYaMIaTfrKU
 L7cD/yYGzzjRmCX0eLQ==
X-Proofpoint-ORIG-GUID: OQF5b_g3wqdC74T1DaGDBgVLye9jZeBi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_030417_983819_3525FB73 
X-CRM114-Status: GOOD (  14.14  )
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

Merging, Bjorn:
===============
All clock changes via Qualcomm clock tree. The defconfig can wait a
cycle or could be applied via the same branch on Qualcomm tree. In case
of the latter, keep it on separate branch in case this needs to be
shared with soc@ tree.

Changes in v3:
- Add tags
- Make SDM_GCC_660 builtin
- Link to v2: https://patch.msgid.link/20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com

Changes in v2:
- Significant rework:
- Add more commits, also for arm32 drivers
- Split defconfig changes to separate commits, so clock can still go
  this cycle and defconfig later. Also, less conflicts.
- Link to v1: https://patch.msgid.link/20260416-clk-qcom-defaults-v1-0-579e75c4cfe5@oss.qualcomm.com
- Dropped most review tags, due to changes.

We should not be really asking whether to enable clock controller
drivers. This is obvious choice.

And if it does not seem obvious, then consider [1].

[1] https://lore.kernel.org/all/CAHk-%3Dwhigg3hvOy7c1j1MXFy6o6CHp0g4Tc3Y-MAk%2BXDssHU0A@mail.gmail.com/

If the approach is fine, I will do similarly with inteconnect and
pinctrl (and maybe others).

Best regards,
Krzysztof

---
Krzysztof Kozlowski (7):
      clk: qcom: Restrict IPQ5424, IPQ6018,IPQ9574, QCM2290 and others to ARM64
      clk: qcom: Restrict A7PLL and IPQ4019 GCC to ARM
      clk: qcom: Make important ARM64 drivers default
      clk: qcom: Make important ARM32 drivers default
      clk: qcom: Add defaults for desired arm64 drivers
      ARM/arm64: defconfig: Drop redundant Qualcomm clock entries
      arm64: defconfig: Switch Qualcomm SDM845, SM8150 and SM8250 drivers to modules

 arch/arm/configs/multi_v7_defconfig |   9 --
 arch/arm/configs/qcom_defconfig     |  14 ---
 arch/arm64/configs/defconfig        | 119 -----------------------
 drivers/clk/qcom/Kconfig            | 186 ++++++++++++++++++++++++++++++++++++
 4 files changed, 186 insertions(+), 142 deletions(-)
---
base-commit: efa85f42554564c3ed7e6ef611ba21025e58c28c
change-id: 20260416-clk-qcom-defaults-8c8d956fb0cd

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


