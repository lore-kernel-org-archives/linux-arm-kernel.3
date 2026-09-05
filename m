Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFC3C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 16:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UXpqHFV2712rxC5fNse5LJiD7+paksBxEi1NQ+E0D5U=; b=kha/2gAY+yq8LWr6cVhgvQhJ38
	QNddP7u75EPXfSFV1LVEcH5B2hh2YK+m3zwNAL+NgfzP++fza806FFaPPoWg9ROUDrHXUsoWlMJJg
	PgEvZ112OlsoQoPOGTAiysG8loqUKsnJrzXCc4uE67IQajG7oBlIoOJUJKwQ6/hi7Zd5Vc+8jACEq
	u3RgwdLLntgqvSE/reJkX6Hy+wZyzr70x4/+WRwY42JFCJmc+YIiUwZtsicd8sgUKByLSehyE1QsC
	XTqnqla45ViJ34f+IuPXCPc25knXD60fbIVU+0Fw3RZxojRgz0p1ki6uQ9G4Y6C/gJaONb3uq8B/8
	/TZRRkXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2tW0-00000004Guj-1JpO;
	Sat, 05 Sep 2026 16:45:16 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2tVx-00000004GuA-1oHg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 16:45:14 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso23527495e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 09:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788626711; x=1789231511; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UXpqHFV2712rxC5fNse5LJiD7+paksBxEi1NQ+E0D5U=;
        b=LZd8Op5B5JXWvEIDq0g4IvLoa/RX8qKcMD/wwZvh+bv34TmAu14hGQ6/qQxAh9FTK1
         RdtNPUmzpxjRb7rdJdj6sF9oPs2s9yUqOH2xLB87ABXX9gTqDs/iW4tC+b+I8DK3QvVE
         9EFxy8Lv44DXb0GOCAWgF6EScAl/iO5odgDhqvMMOalSUFGJ6cfPLeHW5oc193Bb+1na
         vNBYy7vPOPTrv0cnQ1rFXz/3XunQEKMwgf5Tpe6AHnBBQyw7a89kK7H2KWT8GkeGhgtX
         IIiuhjyu4wkRlIuoO9BejDsWLtmX0j4JzKeth4Iwxpp7/RiHAstLWcyeyps6CCnw7GuT
         3QAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788626711; x=1789231511;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UXpqHFV2712rxC5fNse5LJiD7+paksBxEi1NQ+E0D5U=;
        b=fNnIiIYafthEeawrp+KJrlKA0pcFV/VmbMutRxalj+b4/HTJuYshCh0RCL3nLOsiI3
         87QlT8bnpIbCHOMjEpJrla3ph7ZUB78DH7LzLj2Pf1J9nNTyWZpJTU+kISWSVPEKNOOG
         +3Fo6vZIDHeD+lQm3ijAd30l9ns0V2NdeZjN9IuXZoF/Tj8SHllAAIoq+VY3AUf1MYds
         cdN7PIkECmTBL5jcntz4mBO8IDOnhEpYzkGIB9acGC4lgg1Or056oY6CdIZIVUoCnqlu
         VmbPy7xBe3U7oUnOt9ZJF9AE3g1NZ/hz/Y+b2FQwH/ILL1s177L1jMHrzpmw4d8EBrns
         jajg==
X-Forwarded-Encrypted: i=1; AKwUvBxbP2NIzOp/VqVLyC8gmOY6b0KnSqZeveFRyd9WOwxrP+7bhcdQ2fHb7hDz55GkUDpotjX8YuRkN5/Z/CEFLfFW@lists.infradead.org
X-Gm-Message-State: AFuF++lEgBohHatE2/R6cjt1tk3536qgWB7nkNztSr1Kk6yvFVT6q0Tp
	RQUiCTFDzM3mYn92jp3sDtW21linizhUkp+WnQ8ik9utHuzms+5Je0mC
X-Gm-Gg: AYBFou1yBGE5d74l1TwpL5mxMf3pwF3/0SVQp+TCMGvX2wL4aImqlOGjIj83J/UcLZq
	UsevzCetmSxSN9w4sVnFeqnREq3g5Vh5q525l5wLRiMoSz5w/aBkgMw7dmi3mZbqlio2UCP6eps
	ZkRrgpjJAmKZQKPPb1Bnes16QjmQPoEU5g159ibGo2C9xeV3GC2i7tcg9rIT5Eiv2VBHbM4IIB+
	V2+53dATpvHLneReXrKWl9FjtorNoOAxvnjOoOVNmmGnLktWHMkPH78mRhMO6jC2YGb26l6u0MI
	oepMUc5HMjqxp3QeNgsYAg7EJqStjUPdi546gag8VRuopiy3vn9HfdkfsqFJFjQDEjyNTN6tCsK
	mlc0BGaTWeYyIpvc7rwgfHjgY3E5mobUFiApY94d5uL+bgOEZbno26fvDNfUwoaktmmQyqA6eEp
	UwGZIkoQm0M5DX14VQBrvmvAy4ZLm+djk9UWo5O/ov85xtOcTfioojov/Fx6Pt+DbG7N6m1oZjf
	4eDCLmQULd1XzcvNeUailQdPxeeNYk6mBzJSI7LQfuiXI5kI8Jw9O42tAlFBKPjOgDOzXUGjhHh
	7lZ7ANoULGtf4qzP5akEQky8/FQ8fF6ZAey6hQIvpp5QiCBTdyadQuLw20gdF1wD
X-Received: by 2002:a05:600c:4e46:b0:49c:fc6e:8cb4 with SMTP id 5b1f17b1804b1-49cfc6e8e51mr106151725e9.24.1788626711320;
        Sat, 05 Sep 2026 09:45:11 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf75ce49esm276714495e9.1.2026.09.05.09.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 09:45:10 -0700 (PDT)
Date: Sat, 5 Sep 2026 18:45:07 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Steve Wahl <steve.wahl@hpe.com>, 
	Dimitri Sivanich <dimitri.sivanich@hpe.com>, Mike Travis <mike.travis@hpe.com>, 
	Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Tony Lindgren <tony@atomide.com>, 
	Kevin Hilman <khilman@baylibre.com>, linux-omap@vger.kernel.org, 
	Dominik Brodowski <linux@dominikbrodowski.net>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, linux-ide@vger.kernel.org, 
	Ethan Nelson-Moore <enelsonmoore@gmail.com>, Michael Schmitz <schmitzmic@gmail.com>, 
	Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH v2 3/9] docs: kernel-parameters: Drop the edac_report=
 entry
Message-ID: <apxDtqM8UMN5KNjs@gmail.com>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
 <20260905094649.41996-4-kmehltretter@gmail.com>
 <20260905151345.GAapwxqT93wPWHF7u4@fat_crate.local>
 <apwzmSr6b0WEkW86@gmail.com>
 <20260905153336.GBapw2UFa7Sdc0ve_A@fat_crate.local>
 <871pb7zn36.fsf@trenco.lwn.net>
 <20260905162742.GCapxC_ra7hJd27LDR@fat_crate.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905162742.GCapxC_ra7hJd27LDR@fat_crate.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_094513_487785_7358D07F 
X-CRM114-Status: GOOD (  20.52  )
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

On Sat, Sep 05, 2026 at 09:27:42AM +0100, Borislav Petkov wrote:
> On Sat, Sep 05, 2026 at 10:20:45AM -0600, Jonathan Corbet wrote:
> > I would like to emphasize this - slow down a bit and maybe you won't
> > overwhelm the system entirely.

Got it.

> 
> I find myself telling more and more new submitters to slow down. Sounds like
> they don't read our documentation before submitting patches. Especially if the
> file is even called submitting-patches:
> 
> From: Documentation/process/submitting-patches.rst
> 
> Don't get discouraged - or impatient
> ------------------------------------
> 
> After you have submitted your change, be patient and wait.  Reviewers are
> busy people and may not get to your patch right away.
> 
> Once upon a time, patches used to disappear into the void without comment,
> but the development process works more smoothly than that now.  You should
> receive comments within a week or so; if that does not happen, make sure
> that you have sent your patches to the right place.  Wait for a minimum of
> 						     ^^^^^^^^^^^^^^^^^^^^^
> 
> one week before resubmitting or pinging reviewers - possibly longer during
> ^^^^^^^^

That's for "not getting any answers" which is not the case here.

Sending a vX update sometimes feels more urgent because you don't want other 
people to read your buggy old version. But yes, some patience is also good
there. 

Thanks,
Karl

