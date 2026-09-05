Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07AAC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 12:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IR0+lkethKHvrwCdwLXMATakzMSwaAKd6EpWxgPc0oQ=; b=UASCnCj77ekQHJpi+IKoRc01ZH
	+34CQ03UCxzO6V2TRCzN1z0nAqivzfgJcyXuUsqYBGbCJdLSjpSZnfPIdBck5voY6PNkjMXxzhgnG
	NLyhz+wYvh62a8uqcMu0yAusXn9mMte2V95plKs4ylZ86yS0HSL/9tha7WGXfAzGBOijxkcni6ftr
	nAeSp8eXFhm76VxFpi6PARpa/NWBlt41Je55PoEGxdWYgjPA5itzDfBo8JPbWcdfX+1m0zyuftBSt
	XXhuo3QWMxL1XhX47ibugw9hBSmbhOFAKDSBk1bk7j81eIkqGZKnOinv88BnwhPBBK5h5+kAdzRtO
	qL65cDtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2pWq-000000043t4-27lI;
	Sat, 05 Sep 2026 12:29:52 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2pWo-000000043sf-2OWS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 12:29:51 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso30118545e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 05:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788611389; x=1789216189; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IR0+lkethKHvrwCdwLXMATakzMSwaAKd6EpWxgPc0oQ=;
        b=XuMG/cpq5i2DpgTnjIbK5ScvZY67Of/wyTPnEMOIoiJ5iRv4oolTG/iSTFGCKzm19x
         Q6RaGB5zX7PeshRYL2pxfcqAwA82L/HKIJ8MKJfKCR6xHssl87EyPwqXevDY7/HcKOU3
         XOJdS8qHngQED6RJpEu3K4uom10Tckw6mtMSvFzfmAY2ADG5jJH9agh+K8kVnKNXfF7q
         vHjfiiLfRjU5BTfX8EzdrZgWuD7X+0ZCkMbE6pH8xylLppSPUJaPECRruPDdd5pia+x1
         BcPntLyTVHQR/tJIjF+3jMQXasAsRNL84xueNzCoDY9Pfe1nlk71rd2bgfaZmEEtezM6
         1QIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788611389; x=1789216189;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IR0+lkethKHvrwCdwLXMATakzMSwaAKd6EpWxgPc0oQ=;
        b=tNQTRP0mNlc4vSb8vC5pewkCs1S6tGx2NNRFV2pMCZBnlmjL8buG8GYnIde8UBatqE
         Q9i7EqpGZYFSAIjp1QFTx4pGoL4SbTE8z9WNEX/9VJiH6oErdG29tjWyyiIlOpO6k9pp
         dr6Pzq/PZ/YVoAHj08yMkYp+xgqUVgx/kyqjKq9y8DLbkZLwWot7HDuy8zEtDEbHg97x
         +Wr5RM4L5aAbRUu4ol6zJJvRTI+yda+y2Fowrv1wRdUF0R6/dc0wkB9Vkp1OvFx/mFBE
         q3uaCX8Lhdzr9sshK0DQx4shT4F2UWNe3g4RhrgZB3GXhVyU9e1b0SsZMcE+9xRVP5Os
         bKxA==
X-Forwarded-Encrypted: i=1; AKwUvBzLszaJER1g/3VR5ontShU9MPSAOf+BQZ9hgnKZ+XoFbJfKxHnBEKDno9TTEysTDmHUJeDjVxT37rcfyIEzSB8Z@lists.infradead.org
X-Gm-Message-State: AFuF++lrbMUrhFjZtTzButVO7MmmSfif49aWm4lqoyX8rqU57jlBMnMf
	uOa27p2Cyex2vWiMhpiL35m6gS5Q/HBYeI6YMQQ/E9zX6Vg7SVJGYICY
X-Gm-Gg: AYBFou12/Lok7LbgtLc4XKBk/0n5Gps+uL4GO5J2DaXzSMMsTKyGw77oehmiU9XEfOk
	xD6Pjjv6Xpka7QODGJmgh/yD19MDz5DFrWlC3y2lz2xWq1oQczp/2DjNUIJc3sffnscFB4LTe5q
	A+EaZuOmd9UtcET9ReTkcilKkPNyhQZjJO2tebjXls7j7XG1OV4JHyYi/WMuaHlFSuuM1QHrB5v
	/xrdZKhxT481NQl1LHCb5+VNsIAzuqwEB9FjVJvCVnv4AdkW3z6JyXdo+Udm0GeDLAV3j0IvLN8
	+NJsGj/RtRaw5ZlouPPFjJqFJntAP7Ipe39GI1qcVw8Xe+kFxnsPAN0/3wRJLpJW3QRjhY52Fxv
	7RYuDRNMF5L/BQIbaXlGV5VHMqxDjue3U3vueT78yzMAARNrUR4DLM6bd+HNp8Zxysl/7zD1v0W
	W63MDSNxbQBu5rM7ZBKV5ERDqwMVxIRvtutjxzI7dNp4a5ezkSgKNbsvSOn6DU5HwowTfdeY2M3
	BnuZxYO+TbIY5g7KfQrrl1/Lt6lUeCSpoDJ6Ps3CiCqVfdbuZ02rlglg969awji0EWzuUNa1Xur
	rElzFsit+4VY8DhV/sc7PVX7MQmE1QBI3T9gdkyUcvIfWQvnvDnXjuIBPGA9we8E
X-Received: by 2002:a05:600c:3495:b0:496:c1f3:e8f8 with SMTP id 5b1f17b1804b1-49cf8244bc5mr116977535e9.7.1788611388275;
        Sat, 05 Sep 2026 05:29:48 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfbdacc45sm118555475e9.11.2026.09.05.05.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:29:47 -0700 (PDT)
Date: Sat, 5 Sep 2026 14:29:46 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-m68k@lists.linux-m68k.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
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
Subject: Re: [PATCH v2 9/9] docs: kernel-parameters: Drop the pata_legacy.qdi
 and pata_legacy.winbond entries
Message-ID: <apwKitEmOv3ZwLkd@gmail.com>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
 <20260905094649.41996-10-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905094649.41996-10-kmehltretter@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_052950_633076_59A518EC 
X-CRM114-Status: GOOD (  14.05  )
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

On Sat, Sep 05, 2026 at 11:46:49AM +0100, Karl Mehltretter wrote:
> pata_legacy no longer has the qdi and winbond module parameters:
> commit 3c4d783f6922 ("ata: pata_legacy: remove VLB support") removed
> both together with the VLB controller support. The entries also refer
> to CONFIG_PATA_QDI_MODULE and CONFIG_PATA_WINBOND_VLB_MODULE, which do
> not exist either.
> 
> Drop both entries.
> 
> Fixes: 3c4d783f6922 ("ata: pata_legacy: remove VLB support")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> Acked-by: Damien Le Moal <dlemoal@kernel.org>

This one is actually a duplicate, I just found out. Ethan posted a more
complete patch in June that removes all six pata_legacy entries which
commit 3c4d783f6922 ("ata: pata_legacy: remove VLB support") left
behind, this patch covers only two of them:

  https://lore.kernel.org/r/20260607064053.195166-1-enelsonmoore@gmail.com/

It has a Reviewed-by tag from Randy, but does not seem to
have been picked up yet. 

So I suggest: drop 9/9 and take Ethan's patch instead.
The other patches of this series are not affected.

Thanks,
Karl

