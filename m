Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4DBC197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 23:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fj7LGOSrk0w5SNsFMZf4HWgkzLmJvJuks0dPBWfMtzY=; b=cj29H04mHqgSXOjzJTuN3LDTWC
	DVkHLotv83tUG0ipQbp/HyPom6T8ft0XI0mPJRDUzk5f21YNJP4InDYrO9yriAFSXa0U+dFfOrLMj
	fUxBw2M2cpfBSLUi0kC+CyKwB9aTziHoiSHJF3Na89VXwWwezHoFnrr8/uEi/5Jyg4PJOzrwnc0xz
	4fiZvUyY5UIfrcMTsiinpEz3kb21zO7En0ZYQ0z1by2snBGr57WASV2BG3a2MtOeqo2tGYDCUACBK
	he9nL97X0O97fjxDHIVxIPXzwHdhUpj5hQZdx8PswDqYq9lZ1fu+MwgNEqv5xtqvT9DB/DyRi1K90
	zyGWO+aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnn5A-000000098Ld-3pso;
	Thu, 27 Feb 2025 23:14:20 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnn3a-0000000986o-1gFy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 23:12:44 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-438d9c391fcso22065e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 15:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740697961; x=1741302761; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fj7LGOSrk0w5SNsFMZf4HWgkzLmJvJuks0dPBWfMtzY=;
        b=Yk4vYTkGlrgH/4xK6Pk8xIEu01gthzpbUj3MuypsdM75cUvyDrysZ2gjul8mvagMab
         jnAYVCE8eqIL5KK897g+IcAfnYKj7gcjenXc01e+2AKeHLWAPRaOZMatXRl+3q5HhWoO
         aWizzjg6voAG81fEUZbPfVhFvCagiXLBEPr0wWKwICq421GO4sv7y466aDzYaWHzeB8K
         x4PfxO6VMeXRwe/62zlCV9TwAxNmLM98T2+Rylu81KsHwP87S851UTyj8dNqd5syWmGN
         RgWTK2+OdsASfLBh/+9AOegBJ3du7ujcUn0Cl1SdG46PWmzFstDF8A8yiaY4NafGf0XS
         QFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740697961; x=1741302761;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fj7LGOSrk0w5SNsFMZf4HWgkzLmJvJuks0dPBWfMtzY=;
        b=Gd3ySUbt/Mqv3Y1VEB/eiHfE+MoubYUZVgdHg5RyWvsrM6oS+GsJ0sHwSImdHywHaI
         +BiZ9PMmci04W+5pnCqjWH2Z1wI84ZGcZSPHnqbbeRF4A/7oS53jgy681BzpCKKK/6SR
         MbeoJpiITf63t3FHqPXF2qnCncl3CNGHpU4lzKUDiR3BpUzCsXNm0bDtAK66rPMzkd54
         wUkmWiK54u8Gtr+XslLI0T/YTctU4ekUbHZ0x7sk+i1mUGvb8yGBlXg2yhf+n8xgK9js
         FwRIOvO/q5ZQw3Zosvbel4wJCurZrf2XAhpBoIzc56OSUjl0Vf0MXIbt5X4fUfhMqUf8
         zObQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBvT6HQdeMPiYpxHczCJAX82OhkH/EyK7+0WT8GE8iDntP1Fhkey19lcd+BiScRMCcT7iKoqHZqGU9aCoQ2TTT@lists.infradead.org
X-Gm-Message-State: AOJu0YzuBOnGrHLhIzuYzPmwtaIEJiaZDi9pzYksfMJd379TDnIWERN1
	EDXyMw2HcramZeoC4DeAyfORkOFuyf/M4h6OlA+UCND6SYoVcqVwrgoNU3kKtw==
X-Gm-Gg: ASbGncsLClc8VCUH+DcAdMv8rSeSfe72Gj5XXDLjQE/1YbEovF/kNzz5NXibruCSQTZ
	E+fzZLoHUw8KIEa8lrLhSgUcuQxXB9dqucNrV7rTYx7tOjKgsE4cvtP8OUCD77yDHqa84fLQ9ND
	Onh1BKRfiGztIpOqAcr6sQ39gVDGdoMbRYoaDt5+5w+0zBa/6S4BlhKU4Yu0l5FMRtMjBpHdZ58
	h0mXx+A2l5lAu4+kT4y4KyF0CsOSNBWLbRh4xzwOqdZn0/RYd82850XMANOjorfQBLoqV9hCvo6
	t7W7N85BL4NJik5Tb/uTBjdayrhBcRx1z9+9a9EzbKKFENQPOL+A/y4Q9AZSec3tESEgAQ==
X-Google-Smtp-Source: AGHT+IFqQLaqdVWxc8waBGwgBaSF4yEsnQkEr61vpanM2YcoX/7/V0zwkd6V54Vs2QrQ3ETgd2DUJA==
X-Received: by 2002:a05:600c:5618:b0:439:8739:b82b with SMTP id 5b1f17b1804b1-43ba6edd7bbmr333605e9.4.1740697960527;
        Thu, 27 Feb 2025 15:12:40 -0800 (PST)
Received: from google.com (100.235.22.34.bc.googleusercontent.com. [34.22.235.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485db82sm3254105f8f.88.2025.02.27.15.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 15:12:39 -0800 (PST)
Date: Thu, 27 Feb 2025 23:12:37 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, snehalreddy@google.com,
	suzuki.poulose@arm.com, vdonnefort@google.com, will@kernel.org,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH v2 2/4] KVM: arm64: Move the ffa_to_linux definition to
 the ffa header
Message-ID: <Z8DxZY-09R6lwEW3@google.com>
References: <20250227181750.3606372-1-sebastianene@google.com>
 <20250227181750.3606372-3-sebastianene@google.com>
 <20250227202557.d3fd6ylzbaho4pvx@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227202557.d3fd6ylzbaho4pvx@bogus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_151242_439498_E25D046D 
X-CRM114-Status: GOOD (  14.56  )
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

On Thu, Feb 27, 2025 at 08:25:57PM +0000, Sudeep Holla wrote:
> On Thu, Feb 27, 2025 at 06:17:47PM +0000, Sebastian Ene wrote:
> > Keep the ffa_to_linux error map in the header and move it away
> > from the arm ffa driver to make it accessible for other components.
> 
> Do you plan to push/target these changes for v6.15 ? If not, I can take
> this patch with other FF-A changes in my tree for v6.15. Otherwise, it
> is must go along with other changes.
> 

Yes, feel free to pick them with your changes and we can push them
later.

> --
> Regards,
> Sudeep

Thanks,
Sebastian

