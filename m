Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AF9C624DA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 18:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9vi/nZKDsDfSyAIlc9ccf28vm4I4bgIpUZPKJ7f4GE=; b=JagRIdlQrB7wfGrgVYglQ6OQAK
	/aExj1g2RO+3LQKa3IpxNpK663Nrbtynk6PIO8OQYf6SXOmy5MWZsc+vmuasRL2LVvGd/+cRMJcf4
	w6b3+7M/WKM2njZ9UukT8XIPusI6eTNrQkleWFNC/vVU7pRRnPbLLvvenVxkOW04bOi3rN0Vo6Fma
	+rzhTDDkrRI4lyksgn73kBKZjpE5qbE4tcEfUo3CEzoWhE0h1LpVe45KSxKGyn+BeglDAOYAN/haB
	zfpsd+Y/9nkWbOXU5lTcjUFy+1cfwUqeo8ag9qXnomYTl/eLbpeuSoUSfuSIED8rIiqZGmE8MeTFG
	uv8yRrRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CZ8-00000000OKE-32G5;
	Thu, 03 Sep 2026 18:53:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CZ5-00000000OJ5-3iws
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 18:53:37 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3hfL1209790
	for <linux-arm-kernel@lists.infradead.org>; Thu, 3 Sep 2026 18:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Y9vi/nZKDsDfSyAIlc9ccf28
	vm4I4bgIpUZPKJ7f4GE=; b=exZihVhHXKE4LPHfdLGiWPX/SAxms5HufyvbTfNP
	mDV/yVYt1FZ7X4be+GDYRSJV2rbfUzWhdAPIezaCFcNXPp0tyPlnXpxIukxZC5nW
	mIXzy6x9HRcL4M46bu5p+cxL3E929ANQVE8FmdDyiJFYZnuGwpjFBptZ/8L6saBV
	Vmxg2dzvF3TnlQFT2vflzXcX/sOUuTEb8L48I/J2DAIyAtGU2FfGTHEO82wCXJLo
	XPve2CjBN6kys2jTmJknRE8TzVG6rgqEqTqyPsupCY6NcJoBo44qHHT+hw27BWLQ
	unz2o5cKbPpt40ute7gjlfoTFQmolj6JiM7qqMsA+Fvu6A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6p72dyn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 18:53:32 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dbf293831so243692a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 11:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788461611; x=1789066411; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y9vi/nZKDsDfSyAIlc9ccf28vm4I4bgIpUZPKJ7f4GE=;
        b=Sg3rmcX4qU8D2evI5p5sD0elpzT5BhvBaivVbpKWUnZAcjE85FjGMcFRtfFOlgSzM4
         TejnQsXrgAVThMWE0k+1ePf+74zJQ+DJIqU7QmLisTSfx1tFfPUCyBsCiVFnJTJqR5Xl
         eQ1BU08bKqZ4Ve4jt2ldNdN7UMRU6gfuBbWtq6Us3b5NuMkciYDY3xZRlf5cRKb3wAjL
         RQZketG2nzsrp5p8mTlAQhO3Lq+315oI5xpOeDm3zEyqRcljKMlY43g8Px9g9PwjMJaj
         YLTvkx5bJ43YAuDPnyehxLTVWmUDZ16tb9HodgCKCjC31tuu2EiodPez0+K/F7oqtfoB
         aDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788461611; x=1789066411;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y9vi/nZKDsDfSyAIlc9ccf28vm4I4bgIpUZPKJ7f4GE=;
        b=rSdr2zno1P8MZ9Vj51yS6jsfwdyRG6vtkfU+m4SO6tGD1t0TNcpC1Ih3okd5Dnq84W
         fVYyP9CqwKXSohiC/D31FbPyO6iQFkYTsX6rSJCymyccrME8u4HedDYAaUhw6lNQrZaU
         xe86eNbetIEoU0HVMdqzbSlyKYSa4E28G3xFhAiVrefnOQyhg5LvMsukF5qmwmHU7/HT
         jl2x6QTHiDAUNt9BshPZozFJ1WMZYt5fGJTDG8QAY3tEYswumEyYNpRB3Do43Rlj01DX
         aXHA2Nq5vF43XvQWLIRPpqKiaRnvfYELhZK8OfjbIIylZleTagxiha+x7z9HDCyI/AAb
         hZCQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6G3EBl6xPAYzjrYWea6CH0xZKLkS8qiyANReEfOlbFk4/4DGHsXyXD52jlmen11dd0c4TIdfv1AU63ShQYSPa@lists.infradead.org
X-Gm-Message-State: AFuF++kNQS5YWsdfeKnw48gfsnJkIMknXt7E/F4P4akfgmFRafbiED9N
	8isL7LBGSYgHk3iYBufZxqeWTpeNOBYvRLf4evOOhJmJMlJe2ngTtrjeWj+RroUadRuygZVIk86
	YqKu7IChbjx9YXhPn35cjDXCjkUNerRdnrESK/MPtnBhe4AJa98zk4nh2T0IZ4zTwDfu4/zFTX/
	TIgQ==
X-Gm-Gg: AYBFou3ky44kqqLZfFrz870JcBvorBRpObNWYI28GnCdVzLRSr/g9icg2RuWYdntaBG
	cGmDzpkvT1GX0fQCOa0GaZ9t06CAfR1e6rtCIWCcGPAqwYRCxUgYUWbRt/hzqxu9KYFQstxFotf
	0c4vD+rUr3FQp23ELhDdae+umuq24S1TVQUY91qitv90WmmhiBpw0RyY89SUn16KIjGRfVItsXa
	SIYd6OFv/ptdVrISF6prvqmPf0UyqLoIcxN40MYXBYVe7XV3wWCHVqCTAS//orPT019Zj4gpNqV
	Pkgh72xMxxq8cBwFvP+7OXaTfvHeosk2zCZZ6DvqVKFD7acxP2sFPgvJKFezPIvo91hAMnbNS4c
	Vl5JIrZD1jdtgbw==
X-Received: by 2002:a17:90b:4a8e:b0:398:bbe9:73af with SMTP id 98e67ed59e1d1-39b26107ab5mr820691a91.7.1788461611217;
        Thu, 03 Sep 2026 11:53:31 -0700 (PDT)
X-Received: by 2002:a17:90b:4a8e:b0:398:bbe9:73af with SMTP id 98e67ed59e1d1-39b26107ab5mr820628a91.7.1788461610790;
        Thu, 03 Sep 2026 11:53:30 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a62be87sm656611eec.6.2026.09.03.11.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:53:30 -0700 (PDT)
Date: Fri, 4 Sep 2026 00:23:21 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 3/9] net: stmmac: qcom-ethqos: fix RGMII_ID mode to
 use DLL bypass
Message-ID: <apnCIWJ0b3i3P6YG@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-3-f0f4a1d19929@oss.qualcomm.com>
 <42355330-c22a-4fce-98ab-dc22b321ff16@lunn.ch>
 <ai93X/cNWHtEQsDt@oss.qualcomm.com>
 <82705420-771d-41bf-a4d9-ed94dff86ff0@lunn.ch>
 <ajF6q5eKz92ddqVl@oss.qualcomm.com>
 <apU8Yx08/PJiS9Xw@oss.qualcomm.com>
 <b36109c3-00e5-434e-a9b7-46049b0bff40@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b36109c3-00e5-434e-a9b7-46049b0bff40@bootlin.com>
X-Proofpoint-GUID: DNpdW4cYPMNGWlzRwhF05_NZdxjhsxfx
X-Proofpoint-ORIG-GUID: DNpdW4cYPMNGWlzRwhF05_NZdxjhsxfx
X-Authority-Analysis: v=2.4 cv=OZyoyBTY c=1 sm=1 tr=0 ts=6a99c22c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=jdP34snFAAAA:8 a=bKGmqkx0FprkRVM0NBYA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=jlphF6vWLdwq7oh3TaWq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX+g48xUTcTla/
 kHgbYD9jZ55fpgM3JFGVLATr01goTragqKK4DRt+u8HXk8+APS0kNpOxlxqdcG8BSN3TiO1FfoE
 ZsyGu/GRAlTiGAHXoWyJjjEK1SAw5X0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX0uFnrxtsnchT
 /Lh74qHiM39RYSUp20U8kWi64Qk7xZND3RmBgJBX872kz3ayzfV5vyk7+EmLi8+kv8ry3u6oCnT
 hyHF2wSF8ekcU+Xn2skUeQyybvUTT92uygxvwKLJoXxVD8LflyTXH9zsjNtY/YrBPkBCbskJG/N
 l0OdEUwD31EAXMhhlMXwcWTo1XpkOCyVs4+YOPTZBezCEdYPM99filGiaxQqgQx514R7LTrOG15
 rDWervK5j30F5EYfvBJTr338n8Vr2B6DGH+GMy1t8ZyEDhHNa6Qw86cJFVVbvdSjcp7R85ov5bZ
 oVJwKdHsrcCbTsgUOfDAYcSYKUlyH18uATcwJCDaJHyp2N32mINfZzXYhGdBoohf8GMn8/4H9od
 EgXCCCx4hqwCKly1LCPSweIK4Kpz8EjOr4ZeuG7hRFDZjcdtk7fbv/PJNl0Ue0fZYDzqbPDi54H
 khBjM9g6o+UNkD3E17w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_115336_043132_BF3C0551 
X-CRM114-Status: GOOD (  22.63  )
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

Hi Maxim,

On Mon, Aug 31, 2026 at 07:01:04PM +0200, Maxime Chevallier wrote:
> 
> I've been able to get my hands on a qualcomm devkit for ipq8064 :
> 
> Compex WPQ864 6A02, has the IPQ8064 connected to a QCA8337 switch
> through both the ports, one using RGMII (no ID), and one with SGMII.
> 
> The DT is downstream, in OpenWRT :
> 
> https://git.openwrt.org/openwrt/openwrt/tree/target/linux/ipq806x/dts/qcom-ipq8064-ap148.dts#n198
> 
> happy to help in some testing as well if needed, this board is going
> in my CI for stmmac stuff.
> 

That's great. I think this board uses the dwmac-ipq806x driver? It would
be interesting to know if it also does the whole "use RGMII so that the
MAC can manage the delay" thing. While I don't have access to IPQ boards
I will try to figure out what this driver is doing (hopefully I can
track down some documentation about the "NSS_COMMON_CLK_GATE*" registers
it programs.

Nice to hear about your expanding arsenal of stmmac boards :).

	Ayaan

