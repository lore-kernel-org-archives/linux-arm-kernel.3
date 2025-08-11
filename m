Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FDCC87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 06:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H0BX64TErFoIWs1t6Evpyt8styxu8dJRt0rrYpLp44Y=; b=YG1WpFcw+DRtHfGlw0oQpONggR
	qxBOZSJsoM+cWWSrVuAHwj9mku2Dqw2lfD93WxpSeYxNMLet0n1plcZqAwuDB/G+U3qis+ZTP5S+m
	RIY2M3dFNwV9NPwAdEJTVDRyuPyPEWTJ1OqI6+/ARVkPNOrVKWjVMvGivLSltA001k5WGJW65RW/8
	y3XZxbhmBN8R5rKPzXZft/B7cKbfHwdspHtohl50Gmw0N5+MGI35Cy+sbS8ET72e00wqWlTriZ79R
	c2O4iYUVK4jM9JU2FpqzMhv8TbENQigacBv2TUPG3V87XPMqhQGdOKyY3xvareLGyj+cRKpHTBXR2
	5LziKr/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulMS3-00000006eW1-2aOc;
	Mon, 11 Aug 2025 06:56:11 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulMPT-00000006eHP-0T3w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 06:53:32 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2401b855635so29502585ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 Aug 2025 23:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754895210; x=1755500010; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H0BX64TErFoIWs1t6Evpyt8styxu8dJRt0rrYpLp44Y=;
        b=uIbZSU/bsPa7AHnrgZL3P1UMoGqwQi+3jXvX3lYrQSzbx5Y32Wk8LowH8MZb7lE7Zj
         hvS66RwPVjD5qmneSag97NI8hbpQGesTynFDexwFE+a9b2myUK+Fb3G/K9I6vOcbgbz8
         rJ/hYki+wRL3aWXPeTsYF4eRPB+oRMHB3NM65QwKZyWtjxUaxkSGrY9qMpXe0mZZabIE
         rPRQIQ2/qTCNAGEEDO8RVETFS1yZucFrJ6CdVE4KHLKPmpFZOQMXOAPCvboWIto8vT/j
         B84GFDWLUTeBv3n8JJYna66Id6B/UGGpidANM2NbEvlmmw/sb37ITcnhyGjz5vXzbt5D
         G+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754895210; x=1755500010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0BX64TErFoIWs1t6Evpyt8styxu8dJRt0rrYpLp44Y=;
        b=D07gByVcOP6fSlwst0sXx6n8kt/8OWckbSNJZZ9QDqS8k1GqcdoVcdzfmWL5jKBPt5
         B4VSSDYCXh4Q2u+2rQZc9ZRwQZ271GQCvLmxl0+JTdfWK5G1gFjAF0zFAPetgPr/eueP
         Ub7coHa/7mtnChsyHprzVDOPUKu0cJtVdYZWaJBa+gVUuzmcbt1y8tlM373MANLPojoR
         jO7zKdwGf08tE96pcgHvdg4UHmSbdwW4Lxq2xrBCwCZYx22Ip8i/VxPpNX6+6gClLLhQ
         itw4TMdWvsUD9NfJHH5JCT3rcI6bNXiub9Cq9FDXFCUasj2V9PLtb94mtNe0ETMOJXqA
         JN1g==
X-Forwarded-Encrypted: i=1; AJvYcCUbonCTxQ/SsSL18oARQ6Iyq81OuuSEy9oC40CkGNFM0iJYdz6Ed4ibETqXJ0CTP1C58pDs42cNWTdZLbNPNwA8@lists.infradead.org
X-Gm-Message-State: AOJu0YxpL7SISL/8C296Dwbp7wtvDthiW9Fb00hA/0v3bi9f/giP3/Ln
	xrrrKNVvNcJW522xbTSmtg53Ml6DOMkCrjVAhfR+0uU7K74EslTPVjQuHgJehzK+AcE=
X-Gm-Gg: ASbGncsf+EJ6moyIdW1hrep6TDbj6wqSkH7Flm571g5j2FNGg+UL4tjqsrXVVML1zZb
	uWSNSzEkMQTQ+6cS4UcgbZA0r8TcI1dD5iZmlhxFcmYECzSVL0QVGxrmGaXFhdHdIb+T9wwutLV
	dg3kwU1DLopZwW61PkMFdU+4FWPyuIwnqeo6PyE7QRlPU8srQVw/CIwN3/a7vytFYEElVeNJBE6
	VWcWz18GSlNUscPT0cK6BcHSWc6oLoCqfSIC+1rxI2AIMND2u/vR3ho7Bz/6d2Y1qQj1YBjQJ9m
	ZSaU+zu83Cv16bggGRpLW3HqJj2Xlo4eXh27mry8I8vVtsrQv4M4DalEpGdweFIDseGAscTTMHI
	P6wWyjNlMRLzZqMS77BkAxuXx
X-Google-Smtp-Source: AGHT+IEIl0S/VOqDSLXuBI4x/e0A22S456H8IOsSLzikWZ8KM0Gi2SPraGYKilSTYjzIMK0FS+Uavw==
X-Received: by 2002:a17:903:3c30:b0:242:89fd:48cc with SMTP id d9443c01a7336-242c224ccb3mr163220875ad.50.1754895210360;
        Sun, 10 Aug 2025 23:53:30 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef6bcfsm266721525ad.5.2025.08.10.23.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 23:53:29 -0700 (PDT)
Date: Mon, 11 Aug 2025 12:23:27 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: andrew@lunn.ch, gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com, rafael@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, akhileshpatilvnit@gmail.com,
	skhan@linuxfoundation.org
Subject: Re: [PATCH 1/1] cpufreq: armada-37xx: use max() to calculate
 target_vm
Message-ID: <20250811065327.m7hz3676vdzivktn@vireshk-i7>
References: <cover.1754747830.git.akhilesh@ee.iitb.ac.in>
 <26e67441fd3e91beca47fb4b6fb2accbe1088c79.1754747831.git.akhilesh@ee.iitb.ac.in>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26e67441fd3e91beca47fb4b6fb2accbe1088c79.1754747831.git.akhilesh@ee.iitb.ac.in>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_235331_148965_6DC8AD27 
X-CRM114-Status: GOOD (  11.05  )
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

On 09-08-25, 19:46, Akhilesh Patil wrote:
> Use max() macro while calculating target_vm to simplify and improve the
> armada-37xx-cpufreq driver code.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/r/202503251256.rrl65HgY-lkp@intel.com/
> Reported-by: Yang Ruibin <11162571@vivo.com>
> Closes: https://lore.kernel.org/lkml/2c55fb07-b29e-43e0-8697-f75d1f0df89a@vivo.com/
> Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
> ---
>  drivers/cpufreq/armada-37xx-cpufreq.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied. Thanks.

-- 
viresh

