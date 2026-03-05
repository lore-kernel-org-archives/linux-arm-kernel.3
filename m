Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5359EF30924
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9uMywlkuTKkzvOtJwTHxup57VnJ284vbdhoXFQYAsUg=; b=vOfdr7xR622xMW
	LmsdLimEAnV9xM5CCy5IYfX6Se8TUmH1SNjVu8BcsJKhD+I7NJuYi2llA6h/lCun+qo45MbxFODn/
	XKW+3BCLgDnTJhHLIv18WOGLgvNd2Zj1AJ22y9Ah9e7fM7bhjv3QLTlFseh0NHV1iRMMzFaliiJR9
	uxOFeQgQUEhXV5+xaIZhZyXVL72cDgkOPKGY+wBJKiftVbYZEPNtw1hTXYNhH+PPlNFSz8ixtj39z
	UGSBB9K0mfszTHtdilnxVjw3U8OB8QUgWoGjvuLZJj7uwWWjLQWR1VprSmS057xyStYNbo5wguCo5
	Y1onHWL+FjjhZk3uTM9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5Jt-00000001RcA-37cL;
	Thu, 05 Mar 2026 09:48:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5Jr-00000001Rbw-0YX5
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Mar 2026 09:48:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=9uMywlkuTKkzvOtJwTHxup57VnJ284vbdhoXFQYAsUg=; b=meVDGbelmDExGM/d8g9MKu5m/M
	FUOYcto1Wx+ojlHlMnxDDtvWTe0gJylx6cJ3fqT2ZOVsniCi15YHGyqWvsUfD50gwMYKFlWNmCpyw
	G8Gonj0iZKOqN8E5d0dplXMxy1baCb9giOSb47EEjByfKLuSIm+s/t6HyDvXfozAQSoZ63A+OKKsB
	5WCpm+LzXZo8r5DQezqcMas+j4l+QGu6dzDIkg6L9Ctf/PhHF9TCw6/AXRN62MxaWNXp94vIzNU6D
	Ab9bWWORCzs/7gG5OZ1CgYRQGARo0n/0w/7AkEcZ2fKQwsKyfyZ4fZ13dPofGXQkGzvfIaEzSHAw2
	veFV0FkQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5Jn-00000006O3Y-2lWN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:48:34 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6258uDgT3473524
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 09:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9uMywlkuTKkzvOtJwTHxup
	57VnJ284vbdhoXFQYAsUg=; b=RdQJgTBnBTp6E/tuzzGJ1MPF4ZjdP2+esGps7f
	LuhmfZJKAlddrS80rXFkNWvQ3GhHttlOSAv1z5lpHyh12fj/S5uXQwSqAxu2FYto
	jPxwWm2cZ4PNHmPMfSKP+G7Sp3SKW8ERZepVbvVcKQ8TyroMT4ly6UnadJqd7hJl
	oG6cuSqp5HfzcgUYhDNo5ABLwDmXUBJXdueWiklibrFVEJ5Clj+WowjvL0l4aVoO
	6ojG3YcP5IlP0MpDa8BnVZJCA1UmdzeIDMHAg+z6cLvw8lXCUkjUFvl5qHVgrmUo
	PhwK7ZxOk+EaVOm7BrbayGOZiUZIulJiIeAJXbuQx5LUFyig==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpj1846xk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 09:48:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5033b4d599eso617075051cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 01:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704107; x=1773308907; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9uMywlkuTKkzvOtJwTHxup57VnJ284vbdhoXFQYAsUg=;
        b=ShG34wNQFskvUxcgleEHpefySVi0mwQ6gph7lwmMZbTfIMxF7mVYular9vU3Ol8i7h
         ntZQ7tN3ydIX5utisXKoL6G1lvWmWjAWmKP2c0UurNUXL4C36OIiS2GZPovFOxAQUtng
         nv0FqkbEOYGEAIl/2FEZwtzjUtO/4OlzM2PfFmit+zAUjJKXkWNPRDVTJcixeHkqAh6Q
         aC8JCMZC36DlBGEA70bFHxG3ecHqy36ZUQyPtCVzQUBpA9aAKfD3ZdCYPYO3Pm2HMn9Z
         D54PGAi6cPU4hhh4JErw0a35YRkWwKPmFc6Q2D4RlEXAYcDY7ZlkmWU203cjroBa01SG
         0Nzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704107; x=1773308907;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9uMywlkuTKkzvOtJwTHxup57VnJ284vbdhoXFQYAsUg=;
        b=vB7n6Gv1jkgD6iOcfiv7ndpfzEqbD8KWf/nAkDJxS6Q6wA41Qeh/NZG3H7mJzEiEEf
         8kzPwyufsce3p9HBMy23HBlqqWjLZtvhDbj6taxE+3fa07Apkbl2wJXpUWzA0tX3GQDC
         yBCarS8DKIhlQJQDgokUOKm33MQJwgLNGH2juLk3crQSaBe9BsRm8oDqXqto0eBmwFu1
         6P2++Eel3TAhcq0FME5U8B8KmyL8NZ/yOfgAYwT11Y1IoN+gr22Dvq9O7Z5YjLJXuMbk
         OT37BsC6pYC0dlexVSXXWD+yawDqwhQNdfJMqOjAy2q3JM2zt3mT0AIsXzh/bfNP6T0m
         dWuA==
X-Forwarded-Encrypted: i=1; AJvYcCVI0m9YG7fsB0nCkl6/onkwZ9HBLY9YunI9vpqmDKlt5AeuNrJQt05zSHKwx0ThTd5ODhhqz7Huh7mHL4+uNqm4@lists.infradead.org
X-Gm-Message-State: AOJu0YymumtXBMB5+5O5JFXR9F8BDdsWU7eP9VRTpRhZzNb7kjB/eOWR
	g1+dYBzljG4QbL9qK2LFseWwQhObC+5OSqccGQROkWtHdkiZ/VR63aAvhm2zEOKpuv/a78i4MDP
	nvmPq+qAQyRAeetWyMaoGHLRgjQmdRVJoheav98yPqWFYPL37QyQ4wu7hasdQAa7OQmLeANmyek
	GDRw==
X-Gm-Gg: ATEYQzxVm+igBF/GTBBo+C7QOLTZx3TFMvMpbbS2MfHqEJPwU63j1LEeORT7znBQLDK
	5ppIIyjh6583XLzBpqLG+ifS0+pnIYkwz6NPrd8fuzeeV4r7ii09r13o1Wub7cBtkiW5WKTjKj/
	sLZet8uu7pwzaiY0qaisq5Bb+Sfm/FFiweIPVuE8eGOROIrHdeOK9eiNcNEidEqJk7nhHi17JQQ
	+w5VdkxXkY4/RLVHRotRCrbsnCaYzEaokPuzSLzjJCgQ85u8VGz3ROAhXYm/+ZupszO/1gmJuEs
	3F1kxJWf/E8sByipz7SGUVI/6kLrKj6y6EDjVVzfphkFD4uI+gxLVi/0/GZXw2Y3hCGc25jmvkX
	qwfAwUKL8LA6Df8rYqgmbM8nmNDyre/q0PUq/fXXvxnp1EnBwr12TQdPVLrikeMiKg+R+M2gQbS
	B/445nxjWgPtnI
X-Received: by 2002:a05:622a:1909:b0:506:98c9:a3e5 with SMTP id d75a77b69052e-508db35c1e2mr68938141cf.35.1772704107089;
        Thu, 05 Mar 2026 01:48:27 -0800 (PST)
X-Received: by 2002:a05:622a:1909:b0:506:98c9:a3e5 with SMTP id d75a77b69052e-508db35c1e2mr68937761cf.35.1772704106529;
        Thu, 05 Mar 2026 01:48:26 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5074496300fsm177126211cf.2.2026.03.05.01.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:48:25 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v6 0/5] Add CCI and imx577 sensor support for Talos evk
Date: Thu, 05 Mar 2026 17:48:11 +0800
Message-Id: <20260305-sm6150_evk-v6-0-38ce4360d5e0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFtRqWkC/3XQwW7DIAwG4FeJOI8IDCQhp75HNU2QuC1a07SQo
 E1V331Oekml9YJkBJ/t/84SxoCJtcWdRcwhhfFCRfVRsO7kLkfkoaeagQAjAYCnoZJGfGH+5g1
 67C3ag/Idow/XiIfws2L7T6pPIU1j/F3tDMvtwlRCimrLZOCCey8ldL5Rfa13Y0rlbXbnbhyGk
 g62aFltBGleBEVCIw1UfS+N0eqNoDfC6ypZk+CsaHptGwtYvxHMe8GQIJT1shbaCPffDI9nSBF
 vMwU9PZNiA6bk1qDbYpWVAAm0oi2lVU1lNZecHqfxnHG+pimiG3bHwYXzyhLqXUK+9AlTW+S6F
 Dx2QP0ef4P7mtzgAQAA
X-Change-ID: 20251222-sm6150_evk-8ebed9e9f3bc
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772704098; l=3459;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=psIXUkMn5+R5k4TdgFnB0WZTOygVxEGKBTdZs3l2WGc=;
 b=TE/lqu7xbHnOc+2UELh7+dMJu0JAe1+ryIaqgvIFDYuThmkLOYD0u1zWmJeJJF+uqrKNUCkNX
 fgGoDBHzqggDmz536KNeduNSG3S8XPJ+/yf0jylsI+nuH2wr2w1R2MO
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: reclU4COcNFcc2MV0ukwn5fMWUaesqMR
X-Proofpoint-ORIG-GUID: reclU4COcNFcc2MV0ukwn5fMWUaesqMR
X-Authority-Analysis: v=2.4 cv=Ed7FgfmC c=1 sm=1 tr=0 ts=69a9516b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ld4WfEqAmRoefWT_AfQA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3OCBTYWx0ZWRfX4ztWWq2BUkCx
 MC86c2uZ43pw0UNBCZD8szJk38mKSeOQuiucv8JnuK+9FGrB2fzn1pt/1m1jQNgsDN6u+z2rc7l
 2IKKk0CGZyb2fibTIAhbvlaa/nIo/Ugh6Fa48XCJ4qyJ2VpLX4v4jgeLLqbXP5NQ8FiOeKvdtV7
 9WBQ4zjITUbwip5+qB//vrZs70CIOgL3puecuhiEG1IkWLjOOKNHYvV7MhIvTbvQQxeYdRxhc25
 wqajGzj1kNN/4snnvxj2l6TyPwfGRxbZbumxfQ8MO4+HCHWS+iZoxZ7LFd9xp6DfSHV61mnJkVP
 bSLsF3rSmKdJYOkMRe8t4G65NnhIKvCp/D1jmZ/+qC0v2i9vqWeZs5G/fLEKU/8sMnWeb36SSKY
 QjRFeHJnRg8HHnyCJlCY/uZbtmQ9XHsHOFjTIxCbTjHxOTmSkD12uXq48RscKWsFUem1DhIZaqy
 /WKeBmCSewu5sTb+pcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_094832_015782_0F8FC4C4 
X-CRM114-Status: GOOD (  15.91  )
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

Talos EVK is  based on the Qualcomm SM6150 SoC.
It lacks a camera sensor in its default configuration.
This series adds CCI support and enables the IMX577 sensor via CSIPHY1
through device tree overlay.

We have tested IMX577 Sensor on CCI1 with following commands:
- media-ctl -d /dev/media0 --reset
- media-ctl -d /dev/media0 -V '"imx577 1-001a":0[fmt:SRGGB10/4056x3040 field:none]'
- media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0 --capture=5

This patch series depends on patch series:
https://lore.kernel.org/all/20260302121159.1938694-1-tessolveupstream@gmail.com/

Changes in v6:
- Adjust patch order. -- Krzysztof
- Change MCLK pinctrl name and add reset pinctrl. -- Konrad
- Fix typo, rename imx577_ep1 to imx577_ep. -- vladimir
- Link to v5: https://lore.kernel.org/r/20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com

Changes in v5:
- Modify the commit message of the cci dt-binding patch.
- Link to v4: https://lore.kernel.org/r/20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com

Changes in v4:
- Add CCI properties to the existing portfolio. -- Loic, Krzysztof
- Modify the incorrect dtb install configuration. -- Vladimir
- Link to v3: https://lore.kernel.org/r/20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com

Changes in v3:
- Add generic names for the CCI clock. -- Loic, Krzysztof
- Split cci node, removed double space. -- Dmitry
- Rename camera dtso name, add detailed description. -- Dmitry,
  Vladimir, Bryan
- Add dtbo-y for dtso. -- Rob
- Interrupts cell change adaptation.
- Delete cci sleep pinctrl state.
- Link to v2: https://lore.kernel.org/r/20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com

Changes in v2:
- Modify the CCI dts style and commit msg. - Konrad
- Split mclk change as a separate patch. - Vladimir
- Remove clock-lanes. - Vladimir
- Add mclk3(GPIO31). - Vladimir
- Link to v1:
  https://lore.kernel.org/all/20251222-sm6150_evk-v1-0-4d260a31c00d@oss.qualcomm.com/

---
Wenmeng Liu (5):
      dt-bindings: i2c: qcom-cci: Document sm6150 compatible
      arm64: dts: qcom: talos: Add camss node
      arm64: dts: qcom: talos: Add CCI definitions
      arm64: dts: qcom: talos: Add camera MCLK pinctrl
      arm64: dts: qcom: talos-evk-camera: Add DT overlay

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   3 +
 .../boot/dts/qcom/talos-evk-camera-imx577.dtso     |  63 +++++
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi        |   7 +
 arch/arm64/boot/dts/qcom/talos.dtsi                | 279 +++++++++++++++++++++
 5 files changed, 354 insertions(+)
---
base-commit: 9fad1d148df6f36105159c2503d0ecb1397bc89a
change-id: 20251222-sm6150_evk-8ebed9e9f3bc
prerequisite-message-id: 20260302121159.1938694-1-tessolveupstream@gmail.com
prerequisite-patch-id: 065fda916d7faca61113e1230fcc0ce3916442fe
prerequisite-patch-id: c009966e432e7f11bbb895167e32e517b6ff76e3
prerequisite-patch-id: a44d58bc0cfaab99dff8c4e12ecd0312447766be

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>


