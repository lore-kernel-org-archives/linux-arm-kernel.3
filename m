Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E61C9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 08:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jaRIHfyS839pnGmtubgjSGEcFcrMTPnSFxHKmD/d3ug=; b=x7RVqgnoyJPmDrIq5sFCV6GWA8
	2oMobFG+PnEQtbeQEqIcgE9WNjBFrGMD+N9enR36XZm9ygAJG4CbRVMXsJ1L9CPQ5U8Y090PeUHGy
	Fzp0Fs85QuLF+GMCGtE6QzA88s8c6rOoLExl3G4JYAkffWsJzwJoBIskomWpN3NXr46oqszzgoMor
	pHP1ad5wC0tuW7OTpe7YPX4sJMf4Vmpx7ynU+jIPpAbjIAAnrwoY0n4ZaiK+vwECi7Mn34EE+nryn
	RiR7n3D2CWcT8IXImD4I3uqrs5MeiXGtA0YkZO5GlOA85S8qSTMx03hJbRi+PnyLTAMwvWxjwKRLP
	mNTpeQcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6gn-000000005A6-35S2;
	Mon, 28 Sep 2026 08:26:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6gk-0000000059O-20BV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 08:26:19 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S7xqS6361392
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 08:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jaRIHfyS839pnGmtubgjSGEcFcrMTPnSFxHKmD/d3ug=; b=oYfpOOlHfrhYgjZf
	yfWUVqMSpV9zere3l6ZpI7kjRkFXd/83ZnSK0ahwfd3zPEMJkYGe0i/JXF133Lfa
	K6MUpoUVudt2lcS4g66fQ727J4W7F8//AgYst2sOn4/POa8NrAUGS6f3EaHujq/W
	9D/svih1YQd8nqsdXi/NWL0qL9qzJ++R6CWmswX0P6g+EuLA4pnonDCwbcNRw0Wi
	qqeIjvTY1wyC2pVOaX7X469MWo5PcfuPUTvfhnhS0hRDBD5o+HYCxs24XlZLqqJa
	QoIErxUERH5WDlUcDag18u6E7QyU2QALE/RHCml2nChTfmZW+OyfrkVPj2UV1C7/
	e0BiQQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyav49hbu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 08:26:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a1de6d5c3so725553885a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 01:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790583976; x=1791188776; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jaRIHfyS839pnGmtubgjSGEcFcrMTPnSFxHKmD/d3ug=;
        b=JXnqoq+r2fXnn7MsbsPflQuANEX/8+ruHWBc3VoQLLsUDY+lHPftn74iMAExfqUiur
         bE0SPED0ZsCyEoLRKC7yoVzegFlM43Ko/yRqsmiUjVF7DopHdKiBIajiDv0MU5XPxd/2
         11PPt78unwT13rdjF9u+KrUzB/RuorWj022lQowT+1/pCIkEfwJqDCnqBWoWjfnkqLvY
         gBqBgSOHoQ8OjXhq7a+prsamHRusRUQofb/6fqL1CHna7e4w4vUTvFBMQ0/3c9jkwUTh
         MhfI/OAF2DbPT+3GKMnNimUiUxhTD4hHGdqz1VQmKEC/BgLIr5lC9ZHm6k7+xjN0Si0R
         hpvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790583976; x=1791188776;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jaRIHfyS839pnGmtubgjSGEcFcrMTPnSFxHKmD/d3ug=;
        b=MFlR46ZiWQaIoBTlTAPu8VV99N0zMcueqIFeccZrwKo18AdE3SHceJpyFvy6+O/GJV
         FNnnVfIG1NaNbzI0tycQZ2kBcmmwCMgkOAwqJ40sq2BRmUDMUV8ALysFiIR8PkmhLS+V
         T32xgWuciogtItLdgD4Jr7BUTRT8nsvIE/s/WSpzbc2vvuywEKouxsY/x6PwJUNIc57i
         HckWApQuXyzaFVXgzqwsVAq9pfHqNF7wch4CtTh5KyaAX+rSoHl23CvPY+71uMXg0/ap
         VpZtND+ZEqflQB8CLKzxkTY2jDxY5l9C35LhYdlFEZBbHMSnVxnNT3DuRPvBFCBt7pyJ
         f9WQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUaSEzjhxgYJZnbyqnkY/86zM8UDs67hRuSMSksuFFcrC0snNAUe1P90PDzUuXKoRTN9yKbuP7oQxUlUvArzMV@lists.infradead.org
X-Gm-Message-State: AFuF++n0IfPNEdLvKW5K/MUHhSTqvJLiq1kauq0VUuknvl1EFOieFyXJ
	eNUiD38yHkNjibohBZHiZ4IZfvYPaWYMSZMbrSFIHouXTzT71/mk6lvOSEN2IxYRCGF0l4v0l2b
	4g+0t5jsFLTpj8ilTF0Vp6RrcXBT9m7vGsvsyENAqTNvraJhW4CWjYMW+trEn0i4/Q5uELHY43K
	3EYQ==
X-Gm-Gg: AYBFou33nuSV5gKzV3ON7FKk3Cj7Blc9gXPYWAe8g8mXfWuku8UR5nJecpxIU98n6oo
	MdGAsnDNOdxW3T18VYkmaGz9kx6YksAlmf4XZIVB4VZIELlqlFf8uixxCgwhWlpzYG77bA1TzSI
	6FBL59xb3vXVIWQT74iDHmi0ySEpE/9WIMKMC0Psk9mCARSUYtBmMiKq8NAN0UBC/+C0ZNzU4jg
	NTDjGWWQKqRghGNsRdHuh0ieW9RQ7l4CDH/T8ylkzGwaJOWuBmxEd2OyUa8FysmgNolWrWPcsDu
	V5HdTQ9ifB6mnaMxke065djy/HTSLk3NKksOGxQdvcQ2cZ4X4eZaREhF+o94QDKgPTH7Bo39OUS
	UVBZRtGduF1sKF88RlakbqQUIoZQ=
X-Received: by 2002:a05:620a:4381:b0:93c:7955:afd9 with SMTP id af79cd13be357-93c7955d94emr530356685a.52.1790583975931;
        Mon, 28 Sep 2026 01:26:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4381:b0:93c:7955:afd9 with SMTP id af79cd13be357-93c7955d94emr530355385a.52.1790583975552;
        Mon, 28 Sep 2026 01:26:15 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d5f4:8a0a:ffd4:396a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm24546686f8f.35.2026.09.28.01.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 01:26:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>,
        Prasad Bolisetty <pbolisetty@axiado.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
        SriNavmani A <srinavmani@axiado.com>,
        Karthikeyan Mitran <kmitran@axiado.com>,
        Michael Walle <mwalle@kernel.org>,
        Petar Stepanovic <pstepanovic@axiado.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 0/2] gpio: Add support for Axiado AX3005 SGPIO controller
Date: Mon, 28 Sep 2026 10:26:11 +0200
Message-ID: <179058396966.15719.5627642110789688777.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260921-axiado-ax3000-sgpio-controller-v4-0-79c444be7faf@axiado.com>
References: <20260921-axiado-ax3000-sgpio-controller-v4-0-79c444be7faf@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eFg8Kqf7woi-uHilM0zDcciw9ZUxGHoR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzMyBTYWx0ZWRfX2k5OKX8819rY
 z0obiDKjOtG0vpn/SdaUV3rCM+1WJf7WHsMMTdngR4lfYXR1wd6Tv8ejZmL04V+W1KQOVa8yTKS
 a04RCmvN0B28fiZiwo8Q+VbdMKupuh4syJHLI/PuyJkurRfpOwzbMobEyx1aLPw+Y/RJf8lwW1T
 VN03FnoLmgXiHOcUT2uUinC3RorAx0sfcbqBByxOCEGxk1CcUGPXIfeohZ1nrSKKTB71RZp00MQ
 +TCuiEhEoxj3BYEuMFiFoPVWvh81BowNlvdm4VnywajnM/xMGWOZrkjvJJL/QmRofFXbu5/+V3t
 PdlpHSyJyRz2orV4iVk6pIxjn7uTymj23Uo4i86zsLBXjeW+wgxOoNzcLBlIAL0XWsHIMjkcpW+
 UOgsJ6UTc0afFCLeOQWOeiFrhhQVNegOSsneCpU1sxkihzdPS8/cWMZA4iQegQJcNJ2Qq+EvvVz
 1f5WEvvaBnXSkiiD1TA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzMyBTYWx0ZWRfX0/c2PTnPtri6
 atZ4I1Iy9lO3N3GeaD5tmNicZ/ztr5wmTh0+A/8G9VBzn/l2fZfAbnURwLRtxCPF4jYclDJOAKE
 cI1NxjK92GFx5gaiFbNJpelw3CLxb5k=
X-Proofpoint-ORIG-GUID: eFg8Kqf7woi-uHilM0zDcciw9ZUxGHoR
X-Authority-Analysis: v=2.4 cv=MqLHeGae c=1 sm=1 tr=0 ts=6aba24a8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Wkxt52mgQ5FUUMUmAjQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_012618_521494_01CE0E1C 
X-CRM114-Status: GOOD (  14.50  )
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


On Mon, 21 Sep 2026 00:20:21 -0700, Petar Stepanovic wrote:
> Each SGPIO position provides one input GPIO and one output GPIO with
> fixed directions, along with interrupt support for input GPIOs.
> 
> This series adds support for the SGPIO controller found on the Axiado
> AX3005 SoC.
> 
> The series includes:
> - Devicetree binding documentation
> - GPIO driver implementation
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: gpio: add Axiado AX3005 SGPIO controller
      https://git.kernel.org/brgl/c/a7787b818204d6de78e2e83ded0155d8195119e6
[2/2] gpio: axiado: add AX3005 SGPIO controller support
      https://git.kernel.org/brgl/c/dd36a4b7f391eec4daa336c837a197dab0cf6401

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

