Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9348FC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 10:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/aIx7AvdzS5nlXdZ8v4o/L4Qip57mcjCKYS6Puq9LQ=; b=S7X8fFJKIRpefgmHeR6kT1h2b+
	oqFMlFTOMxaa2yE7yo0/E2zC4OgOxkCbeAXObCFdNJYE7w0/REiBhwW3EhLrfIf1rQp94Sky1urN1
	oWALdOLn+Kl5Hq4GF9gkyWtm6eiit3ZdQ45S+lEKSUmzFRvSznWVBw1kmpLv11FHxxfT8xHR8X4Ta
	oxPXP4c3flBHrkYGP0QPa9ZbQjO0ZheuibztPeyH1gl1aY62547m9Oy4iZY14bDcNK/HiN/624yiS
	lIpez1qx/gz3su1vblY4B1VlM2Aj6523JqWTsoXfqksH+Qh+ysTAj7OrW6ABvQgvolNCZv0MG4c9O
	gTgja8jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGxwt-00000008q1e-0xZZ;
	Mon, 19 May 2025 10:42:23 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGxuq-00000008pVy-1NGj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 10:40:17 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22e16234307so39270055ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 03:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747651215; x=1748256015; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i/aIx7AvdzS5nlXdZ8v4o/L4Qip57mcjCKYS6Puq9LQ=;
        b=vDgwE+tvUDJRyki97J0mRFOLEQ+/UY5gOGyqkQa31XGUbytNpp1Vj9QH/YEZrcFMhE
         CWBI5GztijfKLyrZ9vtowFTuU/a1pf43amFHbEIpGq5ZVbhE6z4LaPHI5mnvfWhAoOEi
         GVwlD0vOluqBS7ZkkFfu7wmzOE7nirdFzUOnbwJPDDC596Uluj9i4PbeM50ySXQfp1K2
         qgZUW3fHcxg7BsPoOtOQafaCzEz4T1gX9gdqkiLiFJ6gjf/RfVUX29dq/Ws7VM+TZTSI
         SwfTofaR54EEHUmm5XZCzB+lIoZy7fZOVEvdIpUwT4sZuaqXmR63pDi7dqvOufRp2UUq
         jkEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747651215; x=1748256015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i/aIx7AvdzS5nlXdZ8v4o/L4Qip57mcjCKYS6Puq9LQ=;
        b=UqyYN0fUXWxCq0BNlu7/xW+pDrJ+3h/vOeelNLM2HmduCsOTHxL+2Jz5303vwHeaaW
         cJjRO9he/xQ6S5ttr9fTd5Rw195pvih/6qdAYICryyK9AF85uRCU2+iWx5XQpKQTu26o
         h0MzOKtoVHb8mPhbwoxC8gZtHI/0zOnGKysJnZBCNpWYqNFr9yCyQaduAbCvU2VPtet7
         uQuMXv45ibNbxdfCNnpaEZ8qBYGMHCP4CvBLxMK/xTlDklGzEv78ErlRv3UneqUTDAm3
         wadS3kHwZAZVe4FaAD1JTCTdmYkJbSL5a90gXs+EoHfCKI75ehwswoRlqtmfZ5MbK3p6
         +h8g==
X-Forwarded-Encrypted: i=1; AJvYcCW/bXzVV2Jd4DLSaDU+GAFNK21mtBY7g7wtgKXG2nMazyv7JEim3+oGXkkWK3Zm1L3GdG0bH8aDrAYzAIisZOQF@lists.infradead.org
X-Gm-Message-State: AOJu0YyxjZpPK5hA+vdRyTbWyZdVjingObjK8u5srRu1ONwO1ATSAOMC
	1qkpKyrngdbS/UIZfBdOz7xpVWuoIuq8jm6MHn4kGVNKTEU54/S6hiGhMDqv4pC2KjI=
X-Gm-Gg: ASbGncvc1uTrd6CGRnOW06ApfGVarqE2i+hlNbG1ljhnzqVY92/2egfdX1OyPJOPk/C
	i8jwOjoY4vYlqiyzKJlXLwRshhwSgsDJANmrwSc46H4oHSLkj+PI0F/k+KcR0joFqLyoEN0EEMh
	iStQ9wCWRZQAuCH0o8DDrnVvU1QjyLvcs+WiUWAp2WdIQjBZNfzo7EJwl6K/Lo7yXK02kdkUu6R
	cw53JD9RIh9B3wUqCu8nOEV3flGnomZBu2ggGAcI8/iD/1xCF+3QY3uqxfFTRCPOMOwgEHQLCD7
	WFErdzfFGWSOD/Nzmc0lucd+0R7mkq2k8hY+idFdj1ek84k2NKFk
X-Google-Smtp-Source: AGHT+IGV+/iosPw4tJfGLDNquYrwXS7YO+74bIwXmyBHISJk19CDoPFblHZ0P+89TKUcqBjFApznxA==
X-Received: by 2002:a17:902:c209:b0:231:bc7e:a54f with SMTP id d9443c01a7336-231bc7ea667mr160254935ad.26.1747651215411;
        Mon, 19 May 2025 03:40:15 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97fa6sm56235095ad.135.2025.05.19.03.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:40:14 -0700 (PDT)
Date: Mon, 19 May 2025 16:10:12 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Mike Tipton <quic_mdtipton@quicinc.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@oss.nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4] cpufreq: scmi: Skip SCMI devices that aren't used by
 the CPUs
Message-ID: <20250519104012.acyfoffelestwgtt@vireshk-i7>
References: <20250515035312.3119884-1-quic_mdtipton@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515035312.3119884-1-quic_mdtipton@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_034016_368498_34896063 
X-CRM114-Status: GOOD (  13.00  )
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

On 14-05-25, 20:53, Mike Tipton wrote:
> Currently, all SCMI devices with performance domains attempt to register
> a cpufreq driver, even if their performance domains aren't used to
> control the CPUs. The cpufreq framework only supports registering a
> single driver, so only the first device will succeed. And if that device
> isn't used for the CPUs, then cpufreq will scale the wrong domains.
> 
> To avoid this, return early from scmi_cpufreq_probe() if the probing
> SCMI device isn't referenced by the CPU device phandles.
> 
> This keeps the existing assumption that all CPUs are controlled by a
> single SCMI device.
> 
> Signed-off-by: Mike Tipton <quic_mdtipton@quicinc.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> Tested-by: Cristian Marussi <cristian.marussi@arm.com>

Applied. Thanks.

-- 
viresh

