Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6D6CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 16:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZOml+89Fh4slDZjDTDeUJgvRUxvqEHajVZitLYJCVjk=; b=QegoznxrEJGTsmuebpB4dyPc42
	ZGre2yoUm+/okJ2Hi9wzST8Wnn0nZ+hxFqbCwHgYBE88SRVmjJU5eXKIcng3r/1L65hXYzvu1Jtrz
	yVlXF3T1jrl2ph/jNxGfp2v7GueSv9v4PHZyio/G4WDjXAMN/iO5x1QvDVf5tDU5nMdlG3AInyBvN
	A/ZqDYs3kVmFolJMEUMtI55vvjlTvupGyO7c9Uzj1f47dvndj34QxsLtihaMVIvOYXZXFbFmxuszO
	hJmo+KIJZgGn2qN4h7knC/d9mskfu/qH+vA+cBl96296isTshecuGI2gs1v50KbKwK+F4cwYDE1RF
	VC++rMsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZWzc-0000000G7al-19Pn;
	Tue, 16 Jun 2026 16:50:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZWzZ-0000000G7a2-2ze0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 16:50:27 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GFdeAv026891
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 16:50:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZOml+89Fh4slDZjDTDeUJgvR
	UxvqEHajVZitLYJCVjk=; b=HBcQsOmQY8YSSYu1Pd7AolxN7wxdOV5JaMmftSza
	1HmnymCwzB0EcCCZ+JHWjGiizsEHouhQPLgJtBorYRsBceIJMn/PdvlvpI/T5KqN
	3AbZMx7/dLKqnMSFkgyOhbbDaufPuy4VSJQNwYKOatlJuZMJUx6VC1ycTewcIuau
	ygQ9FUD/2J52U0O9X8Wku9yfzKGEnp9tumOCHz9H/uujiWMm/gHp/5CGLoR/KSr/
	xaDWJDrdvOsZxAQPnfxJOsH6bzoKNpvIRFDf/gTy4C3JMhSj1EKDnEDGV+2jOvDS
	s2moZqVXkPRroWF42OTK0RTB82EKAbFz1DQCgQWAWcjHyw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ety52u9xn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 16:50:24 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8423f544944so3353605b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 09:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781628624; x=1782233424; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOml+89Fh4slDZjDTDeUJgvRUxvqEHajVZitLYJCVjk=;
        b=BFCYjb4IL1AM2wWF1YWKoVSkzoI9JKatJfevP5RPNlwC91YXJhGX0sdNCnEEYfvfBU
         imQeXN/+RAv0LNh/4X4rlPCEyuPbvr4495Lf1oOSDL4QlU8dFNYw6uVtjdCe/Xg1kllQ
         VS5RNZUYlwV5QUAivd1Vs4Razz1Jtffdc4rMzecbTFzw2U2PL8XaKJSZd9jt1lQW0vv1
         ysG6gqF2Ukm5bzk0PRRUlWFZhLpsthEi83LE+R+JYshetcz2vyiR9qIVQOm8UD5xTMHl
         SM04BEa94PBBkKWmGvjBLOZnqN43gUfbyBoomxBYwWsn7rpIGKBfaVmgKShnoIsxeHCn
         +aAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781628624; x=1782233424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZOml+89Fh4slDZjDTDeUJgvRUxvqEHajVZitLYJCVjk=;
        b=EK8nwZGf55lm9aGskHbhqxhPsQyUQCBEWIqBXtcE7YW1oEo/NWJHsEnMgVNHXekUab
         fcZKomqXGVPtMi8PgmVkp0ajTEgF0LQoYzjyy4EUAFDzdQ4SBdiFa9bUsOVRyNyj9oNE
         JwcfEitWIsOspG8NJ3wuNBJa9bpMHSV59DQ2gfGXkfdwZzoticK9efiirLyf0WcaCVbF
         zYvp3ElV8TRuisQ4EUvI6m+DBkPZSRpWmt9s+np6+DfBisMYE1HPp+coiHZkUuVX/d2t
         09r0btTMyjIvZf+3QEuIFSYcBXq66DbLLpw3S93dELgXX3XhUvhaMNTRjyQ2FxdQElrS
         UnXw==
X-Forwarded-Encrypted: i=1; AFNElJ9aq+Ppu+A1YtQPpoXyzGYfSaJw1buiupFM33kFgjZy74H22i7CWzx8R1MzLAyY0lUndrRTb891iPldH9kBGnG9@lists.infradead.org
X-Gm-Message-State: AOJu0YxDG7u6xuO91T4SORtMSn2BT+njZ+XUHsY7UHhUzIpe/5ae2P4j
	o+s6gXbPn659KDjANfR/aTinrAM/H3ulQUxiCO3Kfyettj6ROzxwQuwmbjE+HXKgEdeqBa1O3C7
	EKS0tBy+ruYUziSAFHkKiSn7P6SOlMkIXKOYdudkPKGgX0RJblhQYWQ0RnG847EBuoyZhsFEeQI
	/QKw==
X-Gm-Gg: Acq92OER8qeFG3sbIm3+lkPLQ5cOCTMvck1QEny5y0Jh5WGZ6UZ41TF02qHxfv2/9ji
	HbgRfFoelT95dx98iHB4hr7JvoOQ75qB9/7bBzmVBW7TblUjyS5COruH+lgY4QgkOmZNQGYeV/5
	7T0zj2wdvScA3kG288+dr4Lu5DGN7ddOJ+zjRJQ5zsgj48fIUAKElQNtP9gyJuUNb6m7T1yF3fB
	cx0cKagCM3hmYes4WXWZaISDFW8Gverat9TFu4oubnYk7cQmMs7HVyh62qnlsVAOJdsmp45tktF
	voFn3YKkluLfERKWfRWu+PvwWP10HiexomcnMNA4IOC4o9XUX7TcnIk9ZaEb8MQ9C9p13O1AufG
	+rEje/dTqQYc41EUbtiWiVbFNPBGFo9oj5yA=
X-Received: by 2002:a05:6a00:94cf:b0:842:5da3:9b83 with SMTP id d2e1a72fcca58-8451561d685mr4168489b3a.33.1781628623524;
        Tue, 16 Jun 2026 09:50:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:94cf:b0:842:5da3:9b83 with SMTP id d2e1a72fcca58-8451561d685mr4168450b3a.33.1781628623026;
        Tue, 16 Jun 2026 09:50:23 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b040718sm14167850b3a.51.2026.06.16.09.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 09:50:22 -0700 (PDT)
Date: Tue, 16 Jun 2026 22:20:14 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
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
Subject: Re: [PATCH RFC 8/9] arm64: dts: qcom: shikra-cqs-evk: Enable
 ethernet0
Message-ID: <ajF+xlipLuZtf4HL@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-8-f0f4a1d19929@oss.qualcomm.com>
 <2cb658f3-f564-4396-884d-d025eaa674a1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2cb658f3-f564-4396-884d-d025eaa674a1@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE3MyBTYWx0ZWRfX3YfpN39LUfuK
 xCSuEpejIaSOtWONDnKBKA56eD8YGID+0gC8VlPZBrymhvD0tejQySnWvneSqiOP+h0ORDjOD1Q
 APU0kieOozY7+tCCqGPqpfR4/jNt16A=
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a317ed0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=u2jKJf8zFqWonMdemzYA:9 a=CjuIK1q_8ugA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE3MyBTYWx0ZWRfX5se83PV/MhOE
 Y+DJTa7JooCJ6TuQIjjOKa30HNfXwju/xVct3PZy/UAujtczb3Yhkkquww83lvNyrIT+Mjl78AY
 02GX+ax4q3fB6Kry5ZnO4l0R+AYs0or7y5g588W4Lq5t6K7ysJEcV1apwJr+nekvq//0obP6E1R
 kPhlc1HBvcWzumjj9POq53lWbchFMP/TCia6inKB60vszTuXOBQtLZE2+Wsvqv4ixkk1Kt9PUL5
 5Z4mnWAihxu8Dfq9dLhHe2T5IS0t1wdhAZqZ6jIXW6AsFIv3bmKlyAxmr7IZdZVtd5Rg2C8iaJu
 LHQh5CE+ELig2VSxqfWrDiQPnTe3/pKtbIE1xkGStoNNr+CazoZp4wKhQqPR/+R7m133wONXLRr
 5MuiqyNywQyauWRbOCOWX/4myq0rC0NfKpUAr4NUk+oHGn15QdFsYZ657p1r8SDGgv9stV+lFqr
 k+EXVZpTlmOIJSlM0BQ==
X-Proofpoint-ORIG-GUID: KnhyYM2pcWvbGlzF7gzU2viC8YKqfGwz
X-Proofpoint-GUID: KnhyYM2pcWvbGlzF7gzU2viC8YKqfGwz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_095025_904912_0798F48C 
X-CRM114-Status: GOOD (  18.23  )
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

On Tue, Jun 16, 2026 at 11:50:26AM +0200, Konrad Dybcio wrote:
> On 6/11/26 8:37 PM, Mohd Ayaan Anwar wrote:
> 
> > +&tlmm {
> > +	ethernet0_defaults: ethernet0-defaults-state {
> 
> s/defaults/default
> 
> Please move this definition to shikra.dtsi
> 

The CQM and CQS variants have identical GPIO mapping but the IQS is
different. So should I keep this in shikra.dtsi and overwrite for IQS in
shikra-iqs-evk.dts?


> > +
> > +	emac0_phy_en_hog: emac0-phy-en-hog {
> > +		gpio-hog;
> > +		gpios = <149 GPIO_ACTIVE_HIGH>;
> > +		output-high;
> > +		line-name = "emac0-phy-en";
> > +	};
> 
> This looks like a hack - what does this pin actually do?
> 

The power supply to both PHYs on Shikra is gated by a GPIO pin. I am
unsure whether they should be modelled as a fixed, enable-on-boot
regulator or just like this. They need to be powered on early so that
MDIO can detect them.

Thank you for the review. I will fix the stylistic issues in v2.

	Ayaan

