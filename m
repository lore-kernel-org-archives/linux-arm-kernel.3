Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9F2C88E42
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 05:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ldCwAmi62bta0bScl7eF2OOXIpIyCV8KCS8Mw/m2xj8=; b=vCLfekgQL/K2qxCl3HOimCXqKR
	cXHFNwdOey5IAFGPP39iO4l5YFn1yVrxA6PFGTQiWOKkXlniVKZO8HIEJzLjo/HskYDI0ogoqPoeT
	SBUUcbKp+bTa4bn7+Z2z0Db9hY68MQBz8m3vBD40hzDEEEb39nQYMVzx2vLF1/1LfvgLu7XgFjI/C
	7NX5rNOQP4BJeE2YRDtYLQxlQ2L9zk/u6L9KHa3zjT65SE8jrIPzNWdccWbHDTrIUdkht5F3F4QQa
	mABHApPpf4p3N3+uuDZC+WK8EMyUeOi5eCrW6pwzm+2f4V/V7SIFqQmIuFM4g0FZ7gcUYwFYKnHND
	XiT8d7OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4td7-0000000Fqt3-04jM;
	Fri, 11 Sep 2026 05:16:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4td2-0000000Fqro-2g3j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 05:16:49 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B4vQ8H2986654
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 05:16:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ldCwAmi62bta0bScl7eF2OOX
	IpIyCV8KCS8Mw/m2xj8=; b=MY8P70ytevYKZRTZKipeZaYfAlEgnquIQ7yvefr7
	qQ1AnZ+R6+/o3G6EnARX2+xXjtR3JczsmpQbMNX7YkygXNVRaAxtOVViG1NJY443
	Hjsz4w4r/ZqYSJrNrJX/L0ZLW46+66FGGmltRqsCiSvlPve99Lwjt5j1FYi5WH+q
	X2JOSSCD/GSdd22hYsCKt9zCGnaTB6K/ZZ6LTX/6/BR1ePcUCOj/s9hXHfHHVR9B
	HQ48mlHZDF+daGMHrGmvLccXoJxN+MWFKmW7S4JjX87Rou5MyjDkHlxgWRa6RIH4
	lux1Hx+L4qZ0fe5pggjrhen4FRxwEAy+9OnFxAwXqLPU3A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm1k2a3x8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 05:16:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-399311947f6so1019138a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 22:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789103806; x=1789708606; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ldCwAmi62bta0bScl7eF2OOXIpIyCV8KCS8Mw/m2xj8=;
        b=WHbLFnApLpVGOgj2XypJVkJuk0hmq3kXvRPISwUP9haJ30hQ3adNG186iUQlbou2ID
         wlSKMiKgA+EmY+daI0vuuo/iBLRnoccLCZX344Ru4OdaGRjgsqu35MXO5b3y7l0AM5lP
         aBl2foX60lgJEd1kw+zKAOC6cqVQY/EjP/z4UXh/ba/08cA0sswQt3Yd6Nz/6n6VhVEI
         d8Qv4kygCmlUlv6tr7tmYZDr5+FOwVh2lTIt3wR6iJSiljRuVlqXI6grwMk35rKO+JoB
         gFALOfnZJVK4QksM6CkqanVh9J3h69ORzosG2af0euwOxL2AgDypuSB6RNJJVKA6iHHJ
         eJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789103806; x=1789708606;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ldCwAmi62bta0bScl7eF2OOXIpIyCV8KCS8Mw/m2xj8=;
        b=P8WJoJoC93xviN9y8VhqmyrirWMV5l2ozbQ54aLfQI+qawepGfKY6Fq0ZYl6LM13Tt
         fXMz6r7fvQtQChmrTZQ8gHrN2A46cjAD1KbTOdubxFguIPw26WUXPXqIffUdoVHC2Vvv
         Y8P/OEyQS9bWpK+yMnKJ5yriYm3QmVhlzCvmdMWXLJM74zyBAKMM7GMraeUfqd0l5DHi
         je1cBvO46HUl0nv0puE3C1a8Ozpmqo/OZefM4glrwIFKpa0aNSG3Rym6Z8OlRozHIbap
         76bHsv+o/gM21MzPQz5krIi9NEGACLQcv1eS7pbIwsVyBcKHiu2UcDYVyC1HVJpNteR+
         APlw==
X-Forwarded-Encrypted: i=1; AKwUvBw+4maxSe5Xy1ApEE9vpe1ev1yPMUfTZ2GnCoK2uE0wsqRqYFfsENMDSC1IIdbAGVY9LrtdvgaSQEXWWAFBHwuR@lists.infradead.org
X-Gm-Message-State: AFuF++nMzoPTQdOjoE0o+6BbqnNAEhZeXQ9NNGq5uqhXCo0ZaQLQ9RdF
	cvnL/K4rt80VUkWzW46B1VsQck5uNugKbzzqjO9ONOUA9vB9t8SOtl2JaunbNcsjhVOaUmsxcw/
	zd3rjFcMbw2lDYjM1dVsYlhkRcIKDi5nm59LA/3oVE7q0uj8//LPwMDQ/Ps/MJInXAQZ+8WtJhu
	OGJg==
X-Gm-Gg: AYBFou3LjhcJqZhIofEmXoynAoUUb4XTJ1zKpUuSILT1I+NKJc/PNjeysvaGkmCHXNI
	VzozMZQjI0RUN63eHQQ4M42H4b5GtenMC2BHhNyCwx2OAIWC8q9qfrrGtZHUpFR1nEg/Rpb0Uec
	KzBeXOeKVWJLJp0rzkLH4RX1r8ri//zekx0iMB6X67JLw+JWzWmyxHmKKV0UyGdmq8zZ10jjsR0
	utMsL17W6SH6nOuvQYqXTCw0diam1JelkU5k1T95bzjFMki+n1oDPURaLb62B7hhntJxUnbU2GU
	mn3fDQ3u9m0ZYcrZ1GIpxtoTBhSzTEdaaITX5JwzLNqBdH87WD0h/5+NL28VqZNUktWii8oR0XZ
	Kd+RdUFw4DDMVuhCAnUWP97irpT5SfT6pwaHL
X-Received: by 2002:a17:90b:2549:b0:398:dcfe:967a with SMTP id 98e67ed59e1d1-39d9c227fc1mr3807650a91.17.1789103805692;
        Thu, 10 Sep 2026 22:16:45 -0700 (PDT)
X-Received: by 2002:a17:90b:2549:b0:398:dcfe:967a with SMTP id 98e67ed59e1d1-39d9c227fc1mr3807597a91.17.1789103805142;
        Thu, 10 Sep 2026 22:16:45 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed64fcsm3419325eec.16.2026.09.10.22.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 22:16:44 -0700 (PDT)
Date: Fri, 11 Sep 2026 10:46:37 +0530
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
To: Conor Dooley <conor@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v2 2/2] regulator: rpi-panel-v2: Add required vcc-supply
 support
Message-ID: <aqOOtRE/FMYpZYvD@hu-ssmaurya-hyd.qualcomm.com>
References: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
 <20260907-rpi_reg-v2-2-0c59aa60d31f@oss.qualcomm.com>
 <20260907-ensnare-wanted-e86eeaf770b0@spud>
 <27fb1c11-c1eb-4494-ac38-d794baf80814@sirena.org.uk>
 <20260907-showroom-elevation-ba1a0792b7f7@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-showroom-elevation-ba1a0792b7f7@spud>
X-Authority-Analysis: v=2.4 cv=cM11IVeN c=1 sm=1 tr=0 ts=6aa38ebf cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=oNE1GLUy8bkFCx8mVIwA:9 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: VB8wvv4W7xMsM-PIsHdDZUA8bdIXm3pA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA3MSBTYWx0ZWRfX5lbu1c9BBa8O
 e67w0DLQ6d5MQAk0J5UiWtwU2jrSikPtcyxHXtgX29d7YqErNRH25eNxUIC1lOGlbaumUhyoXU3
 PM/YicJF3Ulsvqi6PpJptj207NMcoLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA3MSBTYWx0ZWRfXxHCLdA4G3t3c
 4REX4ZLw32TGYjOjNMPOXYxFDNMUXetMcSAcI1G5IqbE5NMYXMucHS078QRxj3rDvjbvVS3sn1e
 AHJktnC1lDefP1crwmgufkxuA7v+26pwqx0y5Z6P+IfIcfvf+WdleBHs3gSxibaiIjbGY6sgHUY
 5pdIteRgEGqEvFw1fOBdsskJ5GsPkpkIf8tXtcuh+KSqf3REze/frKjt6Qgk0hWvBq9ti+KkrgV
 4CPPGsu2pTop8eB0U+fluHs+5esICF4ZlIhqw0kruaokeC5S/PNrDCAJpSCha7wfGcRuRgtIoXA
 TxXA+0yUVzWcva42beeNF/t4X2WZsNTl+VauLcnd1ayQW5bmhyAa9kzmwXtt6tAhCJk1VU31ptG
 PvvPrt9msfJ/doTGQRS+r376sUIQQPl+HSQd35lyJ3z5qO6kP1uzoD1m50cZP7TQhsZWpPW9fjB
 T/K1dYcskoLGml1dIrg==
X-Proofpoint-ORIG-GUID: VB8wvv4W7xMsM-PIsHdDZUA8bdIXm3pA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_221648_788959_8CC70996 
X-CRM114-Status: GOOD (  24.78  )
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

On Mon, Sep 07, 2026 at 07:04:21PM +0100, Conor Dooley wrote:
> On Mon, Sep 07, 2026 at 06:09:57PM +0100, Mark Brown wrote:
> > On Mon, Sep 07, 2026 at 06:06:24PM +0100, Conor Dooley wrote:
> > > On Mon, Sep 07, 2026 at 11:16:08AM +0530, Shashank Maurya wrote:
> > 
> > > > +	vcc = devm_regulator_get(&i2c->dev, "vcc");
> > > > +	if (IS_ERR(vcc))
> > > > +		return dev_err_probe(&i2c->dev, PTR_ERR(vcc),
> > > > +				     "Failed to get vcc supply\n");
> > 
> > > This needs to be optional, because without it you'll break existing
> > > devicetrees. Unless you can explain how all existing users are
> > > nonfunctional (e.g. nothing ever enabled the supply, which seems
> > > doubtful given this surely worked when it was added) this must remain
> > > optional.
> > 
> > The core will stub in a dummy regulator for mandatory supplies that
> > don't have anything mapped by firmware, otherwise essentially all
> > regualtors would be optional and our error handling would be a disaster
> > zone.
> 
> I always forget how this works. Thanks for the reminder.
> 
> 

Thanks Mark and Conor for the clarification.

To summarize: the binding marks vcc-supply as required 
(since the hardware genuinely needs this rail), and the driver uses 
devm_regulator_get() which lets the regulator core provide a dummy 
stub for existing devicetrees that don't specify the supply. 
This keeps backward compatibility intact.

Is the series good to go as-is, or is there anything else you'd like 
me to address in a v3?


