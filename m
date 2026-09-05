Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC297C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 15:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xiwfJ3u464HVWwKQuOirA1XlcYzmmwiUzq3bDqr5FyA=; b=10OVpgRCxCksaAkbHHzPr9+lug
	jTWdPn6vzPRPEg3c790UERGQpXqGwMUAEiOmTNM2wOr5888WBuMQ4VOU5S22V82pxbk4Xs80owVwW
	mLlkYJPD/2nhZ9j6PUtp8dK+YUsu7tjDOSaMWl54ScXUusCFknOLiT1Q6SbbMmwdpMrTkmw+CQ8hy
	FZsR6xpaODm4W512IaAL1037x7jTr040qg3MUiOyPlrvFPWBlkgMvkYtRxFcKILjzDnD4HQPOk0qC
	ID4lHW3riX0us+vB3GB7rHH7EVeumdYFVBuzXG/UHvB8sDQz080+WmVTnFrX5FjkJBJpqpBCcVKKf
	dLUJPmRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2sE4-00000004Bno-3pYk;
	Sat, 05 Sep 2026 15:22:40 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2sE2-00000004BnN-1EnR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 15:22:39 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso22678095e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 08:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788621756; x=1789226556; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xiwfJ3u464HVWwKQuOirA1XlcYzmmwiUzq3bDqr5FyA=;
        b=hVep1Z0s+xy+JdF/D4x78V5We2dQtLSnDNrV3T5lye7uDl/tD75fxKc1WwoE0lQc2s
         T/lfbgNLyoS+SQhy3xARzoqX38BuP6G/rmEWOXHc+d2OasBRL83Fnj5Acf/jzp/AYFLh
         liro7XkwvMYDJjSLCJQcJEzoeNpX4JRlhgRRbk01EM0k+ty2Nxsq+/0z9S9fq82j7uz+
         kijm54o3uDk5o4KxyVrOs+HouHOnMTBLchz0bRSqwmd+TGmoCgSDGthTIi/+Hy0ra+kC
         sIIxUwUNK2tC64nQYDjsSJg1lBoLR8JO9bEH6YCCfG3ZMsB/zTNJyylU9au1SE/U0bIY
         R/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788621756; x=1789226556;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xiwfJ3u464HVWwKQuOirA1XlcYzmmwiUzq3bDqr5FyA=;
        b=FTULFOmy4X7m5fIE7ByR3pOv3EH6cVmZnxLK9hfidQ13aa023CBGHDfw+KSeq2RaHi
         UOvqxLJejSLv1yHz5OYNva3OwHlEpKCD22xd5cuuNSUklAODJu4Y7AAxZi9CamDR9Q+2
         yotRG4sYd8Cq9cF9pASN0JXzyql4S/VSdfbVU5pHILQeprYolwRYoDICq6h3OxrvSP4N
         Hn+OCywXOIRerkBh3zXk6WtpVEzfb+W5poxk9K3XFmLzCrKtm7V/Qu9/8X9wq8LTPmjV
         vgtKsJ3P6L0hfGucxmvLz/fhKwTSIFOQqORCekWIgeK4zjSiTsXnih20+iaUAbKuCTLF
         eZEA==
X-Forwarded-Encrypted: i=1; AKwUvBz6FRiDyC6kEE6K3P1ko8pi62/a+GJWfhchph8ZVqsi9UTNNi15dITqjXsce1ejff5fJ0FGuabTaUhFY6z0zPsw@lists.infradead.org
X-Gm-Message-State: AFuF++n8IKBwhSxHmGslbHt+OYtc/X8pKPB0BjrktzKdZo61LAc+qyOA
	5eER6wGvu2MM4sUrRawEsbXGXn754O0kPlW9PuXmcu5mZI5peu+f8YmY
X-Gm-Gg: AYBFou22n15ouTlhVf4mASOsBiMNn3LbsfucjZEi1pXtbdlTzSLz4SjR7LPzuFAXidS
	+GOcnKQYN09+/UGYWRYXdVBfxDQUmTZqFZBrYBkrTfGzK6YFUEzyU/JZ33xSuaQfGe16G+ttT1K
	P1jF7zZSv9/ALN9j5nVGVv9kgEqEtAwIHJYL2u/Z/LSGNTkz1XxFz4DpxkkCQRdY0gwnXvt+eNB
	twP8i+t9+CU/j25SfReloDvVKRT+J+7DNUrfogd5nmJyIfemO16w2rm8vQZhORF3Ci9NoLH/VEP
	to69Pt+FvbxFnJ4schyGsdBXUhWg6szESdjRBx2v2q8tThvBUs1Z3W0Pdtiuuqyvu3tGySa3EBB
	OZAD18cHn+CbasTpLZEhnWcvmyk609sh8DW1fSS+YGeJI7t2x5M+WAa4vbyjikgxadxyo66kx1S
	J4DPFi2lOMtqx7JPKzVf6gjT0AR6UskeMbEX9BGpIyNVy8IncNYHf1t9exOILbz8Nyl/oY9VKyG
	PbEsjLQDL2pJZYK/vAP/YXDJo8T1eDaYN+Z53fqnbRX11WzrGiPFOzaNlu7NdWAVuGbQYxZA2cB
	OtJshDJQ8tq4W3UuJon4JOtmJd2ToHsKOMVPyAvluOwqPzAWtlQWeMbERHi2HHVb
X-Received: by 2002:a05:600c:6303:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-49cf82cbab5mr112017265e9.6.1788621756075;
        Sat, 05 Sep 2026 08:22:36 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5952560sm246185335e9.3.2026.09.05.08.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:22:35 -0700 (PDT)
Date: Sat, 5 Sep 2026 17:22:33 +0200
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
Message-ID: <apwzmSr6b0WEkW86@gmail.com>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
 <20260905094649.41996-4-kmehltretter@gmail.com>
 <20260905151345.GAapwxqT93wPWHF7u4@fat_crate.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905151345.GAapwxqT93wPWHF7u4@fat_crate.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_082238_352985_E8BD670C 
X-CRM114-Status: GOOD (  11.09  )
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

On Sat, Sep 05, 2026 at 08:13:45AM +0100, Borislav Petkov wrote:
> On Sat, Sep 05, 2026 at 11:46:43AM +0200, Karl Mehltretter wrote:
> > edac_report= went away with commit fee27d7d9788 ("EDAC: Delete
> > edac_stub.c"); nothing parses it any more.
> 
> Nope, it was:
> 
> 7fc0b9b995f2 ("EDAC: Drop the EDAC report status checks")
> 

Good catch! I will send a v3.

Thanks,
Karl

