Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58013C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 05:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EzxDPFWdhR1CwYWxIrKgKNHOTHh1qjZSdmpJhs7YnPk=; b=kbKbsXBlUv4i4TEBYV5anIqDrg
	rphyfuMUOl3V8DiELhCVpE84yVmsFb1kkjndHl0teIAIu8eJgAu1DMmXwrkupBJ2pOPwvzJW0e9Wn
	xUZ4yy+/aagTjKhIvHoLZk2F2CSVtD6TGMKGYzu7eMT9spFl4rjNjFMzpKLxuMId+bSO2huykn8gv
	XdyC42jbkcEiSRLMupKiunEWdgzCqJaDmzmaltvHo9T/AbvdQ+0cj0F8C/Ii5wvp1MhGyO3uzBlz/
	s0ilYCRSm3dNDddCqzpCFnRahMKjh9kq1AY7EylK/9iHXoamvm33qyI8+0rjqa/mAZrdqhB79KIns
	qGMTq8YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x74lU-0000000AcMR-2eew;
	Thu, 17 Sep 2026 05:34:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x74lS-0000000AcLi-0uYq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 05:34:31 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H2GqcL1239348
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 05:34:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EzxDPFWdhR1CwYWxIrKgKNHO
	THh1qjZSdmpJhs7YnPk=; b=c9aEMuAWNvXHph3QXnGwuJsYU1VJuTf2v4wAOJiU
	f9rSVOswgyJ/Cuv0x3jAWghXTwDSzTmaLquH0zCrSAvl20M5kospEPhQxJqvCy5X
	4UW+3tUh7OYUDmqa/lhpZ0jnozjspKIVminRa3vmrk8Pa1h1gH8ZQvifOExl5Rlh
	b0eEjGQvdZJm6i1ULqFYFhhZzJm7lvn3EGnETzDZ2Nqsx0QzsTpRiJMKFBjgRlo6
	Khwf6iF74iFjwjIa3L/HqjOHB14vHFm91Wki0QOBZnJK0yOocyFVSyq+8YuLgB6O
	I4FzHClN1xREItSu6QfhAYW+RrCUAp1S56PUp13b+lEhQA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr79m0ms9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 05:34:28 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc42a07d04aso389771a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 22:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789623268; x=1790228068; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EzxDPFWdhR1CwYWxIrKgKNHOTHh1qjZSdmpJhs7YnPk=;
        b=NCTrJLxdTAmLLUHmkjEBoo84D17RiH2jGKvtt3P6dyRSFi0+8/KSm8/uMc8ct6PZL7
         sXjIoQBsRtXba3XSTCiCC9TY15f2dOzAZmaLk/a4mZkXkKDx1njp9GoyCKNtGva5nQSG
         J06msjCvucbB9A6Hnf/MzIysF9iBvOl4QUn4m++RmZp3aQzJEdLxxxi42qIimRNSqdyX
         FbcMp7JRZllW+lQAWGe6trNdkh1nVWqv1OHKOYLf6dPfUyIi7I6b/7b0tEDULub/nxTB
         AlcMWxMX7ZTy9QLA+13oMIZn6LalnXQfnR3kQuiXMSxTn4k9ZJy+lY2sfiTcbPWqStNP
         Gyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789623268; x=1790228068;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EzxDPFWdhR1CwYWxIrKgKNHOTHh1qjZSdmpJhs7YnPk=;
        b=y1ubIVOf8DibgI8UuKFWh6oJhABoiod+Wi0+vXmGq+bWI72XEgFSUAx11rnA2Doon8
         T8bd/IHnnCJFlcj8HNkKPffegNxCO6SURnZQQCZuUKnNCf5PvFj7Uk3qI99a9IIsllq5
         XMgRKb2owROAhfCqzaw+E/hnnGW/APmhQED8T3KNOhUT3pGHkNpbiZZMDMu4jz0EAsn1
         /SpA7W/zGkXFcwU+fiuhSTiYE32zuExCSAMa+JC1glLspCVb44/U/gH3p5ojPE5FhGdl
         9ZPVOCOrfp72VxG2bNK59rJvKdV1SklW7EmnJ+084pc1OU8BUJatkjJmgr6Em8UKgX8S
         4Zbg==
X-Forwarded-Encrypted: i=1; AKwUvBwmdBnPIAcyS774URKJiBkvbfp0yUDHd+7iWTOQO7kNx1tALNTDGcBU1HMnFz/BT7PYXzJrRLSkP3clBKEd6pjp@lists.infradead.org
X-Gm-Message-State: AFuF++ns0zpMaJ0F0XAcAop8d6KKK5A7TceZ/U07zDutet72DBdLLrJE
	68Y14r+Qszu+g2jWMGILk94xuZsubwfD6le9EmkXtRxvd8n7uHou1ZFekQOIunfZSO+cqLMcgss
	+K1VLdKtXT82BNuk8AP1XVNpnXgVxnWc55quRUDZMjYZuxoi/EoyQR3LOyJxlcDrjozezk+CbVB
	PEFg==
X-Gm-Gg: AYBFou1n81xCZxTGDXljsS/23Rahrp2I1rLUXrm4LoXAAozIvHJXJbr/h6PlnoZak0/
	80RrOHNQeNjMgGppq0TQvDZ80x6c9dbZAgxRoAjBbr9kbKGH6H9ljNWl60Bf2I3mqr2hV5tW66q
	67z5+UflG+aZOIZ7+nPOt0zUkwpnk1gv62to7xW1R+ePDH6eUjWvMSsk8tQmALQTlDbuP7wiS/i
	jZxLc0HRzPC3B8OJR6ewfwOw6HFs1seO1Zlytvk05nwAdgJbfzofauu7rNj8/9+VNjFAvZmNnxF
	qUNx3G3VIhud2zVmDr0vMfYSF2xUCb8urFNALmnrphDUMCHFOvGapoz8Hr8QgQUGwv35G+FaRIs
	WLkOSTxLFtWCpRKwXP2Ix/HDWij0Etzcd/zbv
X-Received: by 2002:a05:6a20:6a0c:b0:3b4:5ff3:45cb with SMTP id adf61e73a8af0-3dd5f45a0fcmr13862033637.8.1789623268227;
        Wed, 16 Sep 2026 22:34:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a0c:b0:3b4:5ff3:45cb with SMTP id adf61e73a8af0-3dd5f45a0fcmr13861976637.8.1789623267826;
        Wed, 16 Sep 2026 22:34:27 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b1d335sm13636098eec.28.2026.09.16.22.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 22:34:26 -0700 (PDT)
Date: Thu, 17 Sep 2026 11:04:19 +0530
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: Add RPi 7-inch DSI panel
 overlays for Monaco/Lemans EVK
Message-ID: <aqt72zoSNVGrcY9t@hu-ssmaurya-hyd.qualcomm.com>
References: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
 <aqLGFfQ20mCGFkfl@baldur>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqLGFfQ20mCGFkfl@baldur>
X-Authority-Analysis: v=2.4 cv=Qf7zLcbv c=1 sm=1 tr=0 ts=6aab7be4 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=Q-fNiiVtAAAA:8 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=CPdafjny-J3xFrLEVKkA:9 a=CjuIK1q_8ugA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: m4kqKPsQeapxiYsMyQ-abbhFODMyXSQI
X-Proofpoint-ORIG-GUID: m4kqKPsQeapxiYsMyQ-abbhFODMyXSQI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA3MSBTYWx0ZWRfX9H4LVl5QdPbd
 7kYH2aJa+vnJumr7WQEPsJN+FWBpWLNzxh3NGlIYrtHQ+vFGqWU6yBaomZBlWLhEKdXR0/7uUVB
 NYAMr/nqOwRG747T7dobluOLB+bu8l4iPTwPCckcuyzK/wrCgjJ7nVmGYfTFTkgx6R6Ju90FG2X
 gTvsndhjaF8BJSP4BpPPvii+DnE7pkM/Kv5RKwStJkvG+SelpR5KgEDnaUPTzMmh+zBr/yliX31
 1WRRuzA7shGJgXEQQoktNsMVXNyUMx66tu9/jZ/1W+Qb+cO48nLPvMtcrQEIDhx4S6qelA5ezLR
 797sXPTNYlKIIyJ/9ftip4EjGIptWEJA2l3fAZKTGWZWW5p79HfzrRI9GZ1aKEuUVFt25eP5mII
 P0HfltBQI6FAEU7JWQJh3NLycJsVcVXzB7th5fEHKUmV4ZLXeRjwesRpA/BiUjRGJTRR53oCph9
 IggUrNUgs4Yzjs7aLQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA3MSBTYWx0ZWRfX3oteHOhf0Noz
 51HRkFRoYnqOTH+07IJN89Ws1rWi39S3jg4Ce17o069d6WP3US+v/w1tnIGbOHDdqXZckIyrRXM
 yQDjdtO2zrHcOYKx+kZdEjNyLpT/Eko=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_223430_304107_675F3F28 
X-CRM114-Status: GOOD (  31.44  )
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

On Thu, Sep 10, 2026 at 02:35:41PM -0500, Bjorn Andersson wrote:
> On Mon, Sep 07, 2026 at 12:03:52PM +0530, Shashank Maurya wrote:
> > Add device tree overlays to enable support for the Raspberry Pi 7-inch
> > DSI touchscreen panel on Qualcomm Monaco and Lemans EVK platforms.
> > 
> > The overlays configure the panel on the primary DSI interface using
> > a 2-lane DSI connection and instantiate the panel MCU on the
> > corresponding touchscreen I2C bus for each platform. The changes
> > allow the Raspberry Pi 7-inch display to be used as an external
> > display option on both EVKs without affecting the default platform
> > configuration.
> > 
> > ---
> > To: Bjorn Andersson <andersson@kernel.org>
> > To: Konrad Dybcio <konradybcio@kernel.org>
> > To: Rob Herring <robh@kernel.org>
> > To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > To: Conor Dooley <conor+dt@kernel.org>
> > To: Florian Fainelli <florian.fainelli@broadcom.com>
> > To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-rpi-kernel@lists.infradead.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > 
> > ---
> > Shashank Maurya (2):
> >       arm64: dts: qcom: monaco-evk: Add Raspberry Pi 7-inch DSI panel overlay
> >       arm64: dts: qcom: lemans-evk: Add Raspberry Pi 7-inch DSI panel overlay
> > 
> >  arch/arm64/boot/dts/qcom/Makefile                  |  4 ++
> >  .../dts/qcom/lemans-evk-raspberrypi-dsi-7inch.dtso | 83 ++++++++++++++++++++++
> >  .../dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dtso | 82 +++++++++++++++++++++
> >  3 files changed, 169 insertions(+)
> > ---
> > base-commit: ed2647532a225739e86c7f236a2ce82764ec2772
> > change-id: 20260907-rpi_dts_overlay-58088ffce047
> > prerequisite-message-id: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
> 
> The two dts patches in this series clearly relates to those two
> regulator patches, which has received change requests.
> 
> I would have sent the 4 patches together in a series, but as you didn't
> you sent this series with unmet dependencies.
> 
> All I can do now is reject this series as well. Please send v2 once the
> driver changes has been merged and you have validated this again.
> 
> Regards,
> Bjorn
> 
> > prerequisite-patch-id: 5212bf185b35c36ed8857a67f29e60386d59ac60
> > prerequisite-patch-id: 056a90b913170106a6f8c1feb2366ee83c4375b9
> > 
> > Best regards,
> > --  
> > Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> > 

Hi Bjorn,

Thanks for the review.

The regulator patches and DTS patches are targeting different maintainer trees 
and therefore were developed and submitted from separate workspaces. While the
DTS changes depend on the regulator updates, the two sets of patches cannot 
realistically be carried in a single series because they are reviewed and 
merged through different paths.

I submitted the DTS series separately to start the review process in parallel,
but I understand your concern about the unresolved dependency.

Regards,
Shashank

