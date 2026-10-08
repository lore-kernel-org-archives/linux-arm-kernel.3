Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695D2CA6011
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 18:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VYRZCqGGraVpeg761p+cfhz/OtuypLCZYsOWQkYDTr8=; b=kD++Ooo1bJ5dPb+yCtXQbvOTuy
	EPRHu5q96Jd81pZ+946tNxl5XoObz9N1oSTQ8yHkshdqEur4/+OnG09tKzmnlRKO99WF6YcqJDVxc
	Sg4k8g2L+CrIeMb2HuQWP8IIoJeEjOojziOpamd6VicJOJmhIpoRbtNiYa1EEnXiRYjeIh0B8EbTf
	7BlBn7SmSiVx/Iin/TK5Yo35L0zKPNfBzL/hUi0aIQsZkViWUkGftterNK+ITSqZLwGLXY7p0rJ8h
	MtCbeYM83fRonEcPAcDRqXZWLZpdpnn0yEROwqZzaiwutBmFZV2hHYvdDuqD4FELmEVviEGsr1EKp
	g7nB8HSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEsv1-00000004rsr-26Nx;
	Thu, 08 Oct 2026 18:32:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEsuv-00000004rrd-3CeH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 18:32:37 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698HrJ783961476
	for <linux-arm-kernel@lists.infradead.org>; Thu, 8 Oct 2026 18:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VYRZCqGGraVpeg761p+cfhz/
	OtuypLCZYsOWQkYDTr8=; b=PwlJeFVHJ3ip6Lj/RZu20NHt2C1Qvn31jbRfrbaB
	t9JyF+EzrbUe/ijl+weam6oUwFd9Vuxrh4Sk9VqI38zr9rkkXu5A+b/5Uec94esk
	XaRUqjhbsZYgY2YdFNkBjeywOJ5aA2dEJiVSlqhjt2+W8nhU5WHWZlt9RQrDuQbz
	cD+j5Eh3r5TYRx9b2gsHvCxyv87dkwWrAktR8ceyFmHU/UnPXnhhQVwIRQXxf4EK
	QGHE51LBSRAUao4dzBPMenzNIteJcT7eirio00RL9z+x6ueu02eV1mdIl1f2yKPM
	FQVuMlB3kprUkRowxp34QVQmTcBgGyXQNeojUlqYZ7ADNA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fyj054y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 18:32:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso5370214a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 11:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791484352; x=1792089152; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VYRZCqGGraVpeg761p+cfhz/OtuypLCZYsOWQkYDTr8=;
        b=drqzDOs5WMYCqznGy1/W2NdO3tM7UAI/kfsygepLiXwSRD28MrvMPCyWRu2qgZA/Tq
         f3zSfbJyv8hVbDrquR0jRwyqwuTIxuzs/8JICssrUKRoJjoTBt5mfStfU9gMtfhqqS/3
         fy94tnh0VFLDw1S+/33YFo85WWFhaoZcXPQb4KKVBEM0zcZG9oRzMlYZvkSOYjE2OYfv
         UXvysPSlxhwtW0kb3+ABYfqWEZmxtixqneRsqJegb8WFW+21Ge3cqWt2AxhdbOAPeBuY
         qiKNkUN31aot3WmfwXyC7BwXlhigDXniQqrbYGMJ/dwxEegDbS4Tm3LdXVI+1L+iNEwh
         Tu7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791484352; x=1792089152;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VYRZCqGGraVpeg761p+cfhz/OtuypLCZYsOWQkYDTr8=;
        b=utuCcCcWGLs/6G2UtnBMtLqVDoJHKKwM3f9h2XsasU1xqqUa++di+6A+jxEOb2GmMt
         Js0m/qvljGBJygGZZ//eE7C4IhZkKLXTkQT88G/ALz4Udiu6QSNMOWNcMKBWzsnXpBVb
         zqCorPew3zmFVfbAAjR690VgLAUJBhALq6jADUDGhra7rFsl4nsDWy2lppAzjBKOyBn7
         jzlqn4SwYbS3NqufuzhAiT09zegpHYsaR+Y/vIp9tARAgyT1J5C7nMSkXmnjZk1ZxTW9
         iGgGhXIcDWyR0EP6g9W0eAbh0jpToZmXL+fpdvCBwIgtqaBdhqnZJjIHkhOa7p0PzG8M
         wJaQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEtjEiWkJYS9nlCzqNPmU5KAPRkx9nmiDEwqzPsHwyEF7RIuqBpIyBpjSB4SSpUA+FDrIeVE/FDtDh7VPja+z2@lists.infradead.org
X-Gm-Message-State: AFq9FYIs+mJ+XInkYnOnYlPOh9Wt80qTi0Pl/8KBpFL9hKcQ1/RMWyRD
	otbdlHQ04stkQmBlG6rzOOh6DAqkWZ0rB9Fe0I0nY1U4tnpEm3bulDVDfR8/hyAJCKNY//P3X4Z
	rUrLVIBj4h8ogyrpXdhVgisvvpA8lzdL8JfTW4quXmFSgnmnZTF4vY14MqHd/Fmqrv3BwHZmCFx
	Kdbg==
X-Gm-Gg: AYBFou1QalWNcCMy6TbPBwWELHn58tLmzykfcH4xWOKyaNGvkW8pHUfSSqNC9MF53aP
	sODZUe6z4MHc9VoPDS6wNN4yQhDE1w903ZjFWCzEVclk1kD5trrlwS3uiQwsr+pWcMsc44nlGiW
	9Yici8X6Z1gUkGMj3W1NhVV/IY8j838vqJ5ejttWd+85FX+zr299vnhHZ5krRnJgwsNAJLWbQPC
	ED0ioVv1LJn6n3h6ucfM6oB5oAGK7gzck6YXz/T+ZkG4aOp2tYFosYbIf2HhWtBof0eWzGsEIOq
	W19fZPf42DQ4ZbclzMormK/VgdhiSn6FYQtMekcAOH3W2Rz4CCGWrHjSw9fS9ouf0g2BcXVlxlF
	TDn8+RQ1/mapPuUv2I2vGTVUdt3+I8GyAO7o=
X-Received: by 2002:a17:90a:e7c3:b0:3a7:a463:54c2 with SMTP id 98e67ed59e1d1-3a8a1aecb9fmr5592689a91.35.1791484351787;
        Thu, 08 Oct 2026 11:32:31 -0700 (PDT)
X-Received: by 2002:a17:90a:e7c3:b0:3a7:a463:54c2 with SMTP id 98e67ed59e1d1-3a8a1aecb9fmr5592664a91.35.1791484351171;
        Thu, 08 Oct 2026 11:32:31 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32d5a429sm113929a91.0.2026.10.08.11.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 11:32:30 -0700 (PDT)
Date: Fri, 9 Oct 2026 00:02:23 +0530
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: monaco-evk: Add Raspberry Pi
 7-inch DSI panel overlay
Message-ID: <asfht3z8O1MzMufs@hu-ssmaurya-hyd.qualcomm.com>
References: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
 <20260907-rpi_dts_overlay-v2-1-a4989322ce00@oss.qualcomm.com>
 <w4vltai3lbzu3dq4w27jjotlu5nobc6vfnuxoo47g6mrkhr5ta@tmmd4ug4gzyv>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <w4vltai3lbzu3dq4w27jjotlu5nobc6vfnuxoo47g6mrkhr5ta@tmmd4ug4gzyv>
X-Authority-Analysis: v=2.4 cv=BfpNQbt2 c=1 sm=1 tr=0 ts=6ac7e1c0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=FWuPlianXOF5sMIjmo4A:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: acMeZgtyySkgkeKrCoFvkK5eNY6zP7lF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA3MyBTYWx0ZWRfX5K4PYTp3ZEpZ
 a/A5Vn4V6JeLS/xSzvp9F9QWO2ACZ5z2Agtlt1DThu2Za7zJj3Bk3DgAdzROhnxlX+Y0Ch5/Tf2
 EK98FdGGL3v+K+YtbEuKMiz3EkbSK5OPTIvOAS+PtntPoA98kREhc3Wiu4t8bNi9EQoqUhIS4T/
 h2/shtG9W2GVeetVzKsL5ZO0xN491Vr+t0269YJZ78Q/kjOggyiLzbktGDElFOB2L0nUJrQ9VpZ
 O0mVleY/K7Ll5wB6VGzOWfrbTUXlNF3TzvM5aduPjafuGp6UeZVstQO4ahYe/8TDwupnjIdrmCM
 mXth87fMPoOwbxSMmel0y/im1Wl2K7PgzYiKvMleseaiLd3JEH6muc+z04USFF33FMS0MmyWkVL
 wW4JKLZ2Dgkz1EnB2IJEcr0ewttQbKzsRy49Jd/evTH/Hr2rhdCgsQZBCvj5CV65Ujp9GIRldym
 I3zhRQSyxk1zZJGq6/w==
X-Proofpoint-GUID: acMeZgtyySkgkeKrCoFvkK5eNY6zP7lF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA3MyBTYWx0ZWRfXzLHNhD2OqH7O
 7hriGHRhrIlFl0802Gb1lsYYA+Lkv4/CzTiLcGnj6Ne2W8FyF/BBhIsL77KxUqvDoI76ODCwwVo
 u2cm6hLiZIrNvEQBkchn8c6GbQhZSO0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_06,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_113233_922261_205D7EFD 
X-CRM114-Status: GOOD (  18.65  )
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

On Mon, Oct 05, 2026 at 09:34:16AM +0300, Dmitry Baryshkov wrote:
> On Mon, Sep 07, 2026 at 12:03:53PM +0530, Shashank Maurya wrote:
> > Add a DT overlay for the Raspberry Pi 7" DSI touchscreen panel on
> > Monaco EVK, using mdss_dsi0 with 2 data lanes and the panel MCU on
> > I2C8.
> > 
> > Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile                  |  2 +
> >  .../dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dtso | 82 ++++++++++++++++++++++
> >  2 files changed, 84 insertions(+)
> > 
> > +
> > +	reg_backlight: reg_backlight@45 {
> 
> Can there be an underscrore in the DT node name? No. Is reg_backlight a
> generic name? No.
> 
> Use regulator@45
> 
> > +		compatible = "raspberrypi,touchscreen-panel-regulator-v2";
> > +		reg = <0x45>;
> > +
> > +		vcc-supply = <&reg_dsi_touch>;
> > +		gpio-controller;
> > +		#gpio-cells = <2>;
> > +		#pwm-cells = <3>;
> > +	};
> > +};
> > +
> 
> -- 
> With best wishes
> Dmitry
Sure Dmitry, we will take care of all above points in next revision.

