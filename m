Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABE2C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 03:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wCiz+sabDeeau8SEKk5GsN1jfadMcq+hi9aKPPfDvcI=; b=bPXzw/4kYTXof+3AuXeZW2IHb7
	dHSFdCcZu00w3oaWMXmzoMEmGlW5daWUQbrQnP6/IvTKR6EtAflza0TfyFyslf0hcPmEK0TVEW/EJ
	bWKQQHQjFqywSvZcnhA3af54AJur24MISuQV6r03lte6wS01jqCYbGB1XeYOQ0De3Wp4Vnq8xOumr
	yNWFNU+n+GyO8mz+64//6ltjz8L4Z1SPxiPUvHwAlrumndElSfItGNZkxrlF9cHFCPbaoWiSlRdN9
	yrcaqM+PP+QUZPuDaH9TvLDw2IK0xX7yn7UXr04RMIi92bS+7J05KpVUMKBpLITLvxVkvE1sL+97l
	ErkJEVRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYdAN-0000000GvfE-0Cyv;
	Fri, 17 Jan 2025 03:37:03 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYd96-0000000Gva1-2qQS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 03:35:45 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21634338cfdso40965645ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 19:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737084944; x=1737689744; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wCiz+sabDeeau8SEKk5GsN1jfadMcq+hi9aKPPfDvcI=;
        b=cTab1qWfvt848fCrkYFgb1keEVemV7mhOFRuG96tqNBahVaKtAbJszFdQ8+zQHU1RS
         xTQLs1l1Npp/+pf8XkjCxszSavsxfPXFFkcVzyzqSD4uM4EdG4Tr1HQTjLxLOM1dplqg
         S+r8Vo+N1xD1Af9fdr1LcUJTqhxD+aTtjuvUhwq2wW6/iuxtlXIaP5StxMAlvh5fSsFk
         W7PtavtI4K616k7oIqtOAD6krx5mm7WfDROwWPL3EgR4MXIiVfEPwgulLdjLCw5WevLm
         J3gfupN3mLliOvMQVf9tjiwMIxnLVN0aFkQs1JzjpXLfTolk7wJBcNifInqP1H/zEmGH
         Ej6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737084944; x=1737689744;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCiz+sabDeeau8SEKk5GsN1jfadMcq+hi9aKPPfDvcI=;
        b=d5ghSSrfKuvK9YmBp3mqUuxRBxlAXgOqsBbHwsLB3/fkctFdGBnbXAeL5vsugHOAOB
         lInTonWr3DgXGop1QwSXc6OSVTcke7PFnYrbbrWBwc0vXjHRKn4W6w+rwJAeoBBuKTqe
         qHJdKT0mFYprPkNxcwlVeBMkf6XD/1gI/CRMo+SzPj6KE1bZt1Yx5OnFamq6BZGLWfm9
         O3qZaEdWSJd6fAO7ieBPpE9CVIj1rxq5lMrs1pYJeKC4K11T13OcDIeDJA82b5ZhMC1I
         v/pq87yI16D/51jWD59Ig1mS525gonQE0VZsLg9FcoDQdOzMh0zQRtvEHpJKqvG68hJp
         9ahA==
X-Forwarded-Encrypted: i=1; AJvYcCVh4VUAw+zmCinWWv5FTBxSVQAxoIaIYGZJz0XEyEpZrphWo0XGtTuI1OM5rxOL1MgIXjGKulazRw7U8ZFrtgH4@lists.infradead.org
X-Gm-Message-State: AOJu0YwC8rvhH/6qlqSlbq09VXT4/mcae7Wrxp+EanzRBFhrDiSD4L1m
	1yU1geHc8TUQa9xqhnimrDMjgoNueIn6NyuTpks2FVn/AyTfVvsOmAcdiNrzaik=
X-Gm-Gg: ASbGncuoONpIKwr8B9RRfGddkwYJozUm3FhwrXLN7ujR+clmG10rQWF/jH1oE06g8Xk
	4CXI3CI3sDxn4W1fi5sFXb5KrzUsxhlK/K/6ooLkxqs+Slz9TFhFnzHwInT3ju/h8JdEmYdxQQw
	J2X6hcP1p7OxSy/oYk2flLy4g6RAvnNqssY9nO/ts1tu1Ue8vVIys1z7JHBtrtblhRGEsI6Iw0m
	e4ztjp3wHYIWCRk85NaXVWctXul6ZfOzNOtmcPRbjoomNZahm2isG/I1AM=
X-Google-Smtp-Source: AGHT+IF5Ygdj23ZD7GuKZPa9QsTHhprHgm42ulCzwj5UoaKE1u+8zqF+SlF34qHYFtOsB+w9cQjK2Q==
X-Received: by 2002:a17:902:ea05:b0:216:3d72:1712 with SMTP id d9443c01a7336-21c3579359cmr18630745ad.48.1737084943861;
        Thu, 16 Jan 2025 19:35:43 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2cea1fe9sm7100525ad.2.2025.01.16.19.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 19:35:43 -0800 (PST)
Date: Fri, 17 Jan 2025 09:05:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, upstream@airoha.com
Subject: Re: [PATCH v10 1/2] pmdomain: airoha: Add Airoha CPU PM Domain
 support
Message-ID: <20250117033538.pnh52c7qd2bb7h2z@vireshk-i7>
References: <20250109131313.32317-1-ansuelsmth@gmail.com>
 <20250116070214.vdnbyyqnciifngha@vireshk-i7>
 <CAPDyKFr_z3WUyO2bTV7fPt8=ECdoHCERd=f5UN8MmNpyN=Rm_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFr_z3WUyO2bTV7fPt8=ECdoHCERd=f5UN8MmNpyN=Rm_A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_193544_730600_5E708B8A 
X-CRM114-Status: GOOD (  18.34  )
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

On 16-01-25, 16:58, Ulf Hansson wrote:
> On Thu, 16 Jan 2025 at 08:02, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > Ulf,
> >
> > On 09-01-25, 14:12, Christian Marangi wrote:
> > > Add Airoha CPU PM Domain support to control frequency and power of CPU
> > > present on Airoha EN7581 SoC.
> > >
> > > Frequency and power can be controlled with the use of the SMC command by
> > > passing the performance state. The driver also expose a read-only clock
> > > that expose the current CPU frequency with SMC command.
> > >
> > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > ---
> > > Changes v10:
> > > - Depends on HAVE_ARM_SMCCC
> > > Changes v9:
> > > - Fix compile error targetting wrong branch (remove_new change)
> > > Changes v8:
> > > - Add this patch
> > > - Use SMC invoke instead of 1.2
> >
> > Any inputs on this ?
> 
> Apologize for the delay! This looks good to me! So, applied for next
> to my pmdomain tree, thanks!
> 
> I assume Viresh will take the cpufreq patch via his tree? Please let
> me know if you prefer another route.

Applied 2/2. Thanks.

-- 
viresh

