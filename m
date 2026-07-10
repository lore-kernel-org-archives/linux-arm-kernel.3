Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD9AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 05:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8DddMInZ7IA1pfySnmNQl3FXCwNGcPaWp2vWIBS2398=; b=V4yTSViJ2uFZ2uW/qll35UySMm
	op19rMOzNUaEvc4fVYcKuktqjPyKx1Cum4xQZ9aOZkYtdGiqWFAw5qbC7zcx71rCnhQkB5VK/om8Q
	81fvycFt1gIealEkcfT+WxsT7NvYptLMQt6PK2giMJvROlPk3NaQS9D2XoBkVxG5JFIGTXZmZgNd/
	x7UDiqbqUgcfZfnbfocyoqMVfXe4dBsoOmaz+WR7kKg8xpowgw25KC0GCNzWlVU5inU1NkCDO26nK
	sri+ZWoFYpw5j7b7RB5ed06jlDd/hT3x0spbe8XZ2gVJ4WgJ0KrPKRRbaundKn8dRXKX5YYJnvhvS
	n4I9l4Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi48N-00000004DvB-1SOj;
	Fri, 10 Jul 2026 05:50:47 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi48L-00000004DuC-0pgu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 05:50:46 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2cce6a0c9c3so4499935ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 22:50:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783662644; cv=none;
        d=google.com; s=arc-20260327;
        b=Dx6JZWQaY0JL4jbh7duvKc6YQy3l1qzycKfVhISzqr70eBMY8tpCxvM7645E60pypK
         LaGBX72E7cx8tOSOsdMX5n0fzb953zijL0aDH6fQ+eLuU4q5YQRB70xOrTP2djhCpxYU
         sPkQxNHThKBpYDjfyPN217cqFN7UeLKZEIRJw4TK2jlAmMIYB1VlCLxdKlGlXuQGW10/
         8NIKhyWo80UyH2ruCFrHd96fllYmojUzQU0xL86f95ZfCG173ng1F5+oNXYQIWCUQ7aB
         Q5Un6gIciWuSlQDq3W8QJ6DL/TFIuNR+njClYPaFCb7xktolWFKythHM3h0gAml/gR41
         44Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8DddMInZ7IA1pfySnmNQl3FXCwNGcPaWp2vWIBS2398=;
        fh=tbtcbaO+GCtj/OQuw1C6BF//ge75tnQ//6t5qEtSVEw=;
        b=YeYz58Ek8GrTymg+8FROBd5rPN3PtyS2mPGgvmsUDeMCbG9kOfIAcI64EBU0est2oi
         eg68t2x/uN2s/JkwTYT4FsTiyc7JAtubJUuix2knIZTq43JB5x9DsCekpZz3lzOAeOhf
         HDjMuVbevNOx5OUK1NB9kg+n8zOY7he7+eD5Ou6rFYekihoICX6KmjyJA7dpMmUv8jJ+
         DJJhfdOMz94r4jqZkmh3l8RUzGF05FdI9r6Y7hrWfzmM6eDle7QJ+eW/45kbMQ9Yo+H/
         fO1jZ85YuE88hermEy59x/zM6JBEEq9UB3SWuAKNaMdeV0LBWmesmnqj/h1yYvNKXaYO
         zhgQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783662644; x=1784267444; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8DddMInZ7IA1pfySnmNQl3FXCwNGcPaWp2vWIBS2398=;
        b=m9f0qpTyvPapCYk/FoQFam4DwfSVHnWXcgnfC94PYumZ4md9wr6a9+RVSt5uzAl/sM
         v/JhH9RyPySCj16SK1WqgLlxacZZ2M+HxP7hHaPpNJuR+eeqyLB67Uuirh0ObcvJo1eH
         oSAxgKaWDJIUZym5K1LLX6Vlnf0k7a/WoB+vi/vrRSD+HrWc7SvjXge6o54APk4JQIbQ
         /6q61EXU6gV7NDDPsmjPAdUHLqJQGIy7O+qy/qQygroJSwl0oqHwCbP/2xIxAW9gbRQZ
         RJkrv082Lp/Q9licn6TY34dhycllQ9IwCjSQTb79PwsqAGPFXoYNb3pEHRJqum+X5Uak
         ai8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783662644; x=1784267444;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8DddMInZ7IA1pfySnmNQl3FXCwNGcPaWp2vWIBS2398=;
        b=PTNqsryA5rLB+nk5Zsaf4yWRQG0ISB11lk75Wc2D74i007JW58zU91jf4JLe3YW3oA
         PUqWfsEFOTXzdQUkNws6rKcozm/XKKW/zqV6mHBUCnCcqC+yT86Aj1ykmeOXvKKRiyLG
         6rFOgtOBzs1BNKs3PwhICekN3Dxzi66+bLpz0Bnzvss+AER6FqwMwHiLKpwSck3HagdG
         IcUrsVeZ348Ppjhec9aJIgmBMwBr8wDj4N3PPa6hy4MQriuO7Phi3oC3VzceoNkyM0Ek
         rV7rbV5v7BL9bdAl4Rud0msBeaduP17Cie3prYfoPGbEBbNX2U6QissTYMZECvAHUxmL
         YI4A==
X-Forwarded-Encrypted: i=1; AHgh+RohmHBWKMM73teTH8lcsyq0xAbN3Y5iR7hpIljMu1yXwiJxThVgPsuha7Fgob/lGQAJJTZ140L2SGlSbEySAaBc@lists.infradead.org
X-Gm-Message-State: AOJu0Yw56UDp5/7YRJ4WDFD86uuJ/YeAoSOfmpuq0kepoQjlI2CMy5eJ
	88JetlT4Rh7nugAjAOE6N5l5hsUtuednIgm7KNp1JX+TgP8LmKQgcnflXSdUMcqAOObbcVhigzz
	HTRPAaCkDLqUh8oDKAr/3Jrt9hfNaMTQ=
X-Gm-Gg: AfdE7cl+oFlZ1Ej1mFhD91Fi90ClQQBvaAHFcJEuI5LOBAFiQnnUUj8FPPZJo4KlocM
	VvcTKz8GHds1cCA0OLsogcHln+ESKe9Vu24CaGPOaVn3/UvI9iD4Mi7lcKb1c2bSDQAgYrd2vG+
	BtxgscqEBFh31Fqec9qmmQw3g1tFRfAziYrjzcoV2OE1Q06GuNKJtD/N480my2HnVL4WEyMabXF
	O7IpDrCuEpwuoaep/y6k3/zBgbe6++q1PvUNUlA/+GDCtbHE+Aovhxp4ojhXTAJyLrPXa2ioZRA
	9XwNeXPnqMTRun0H1oLpDQQ85hpSYw==
X-Received: by 2002:a17:902:f78b:b0:2ce:6d4a:5b8a with SMTP id
 d9443c01a7336-2ce6d4a5c71mr61147605ad.38.1783662643951; Thu, 09 Jul 2026
 22:50:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260709205538.73157-1-zuiderhoekl@gmail.com>
In-Reply-To: <20260709205538.73157-1-zuiderhoekl@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 10 Jul 2026 07:50:31 +0200
X-Gm-Features: AUfX_myPorv7UXy0UOv5TQvSWql4a3XLrVFEv1QWo1DUc3NB-2t7-ryf9s8Kppg
Message-ID: <CAFBinCDVn0+m1MybMvoNOXyNk+8KuxQrxrou=KseHue+EZbP5g@mail.gmail.com>
Subject: Re: [PATCH] GPU: drm: meson: inline call to drm_simple_encoder_init()
To: Liam Zuiderhoek <zuiderhoekl@gmail.com>
Cc: dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, khilman@baylibre.com, 
	jbrunet@baylibre.com, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_225045_241561_F5329625 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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

Hello,

On Thu, Jul 9, 2026 at 10:56=E2=80=AFPM Liam Zuiderhoek <zuiderhoekl@gmail.=
com> wrote:
>
> This commit inlines the function drm_simple_encoder_init for the meson
> driver. It replaces the simple encoder init call with drm_encoder_init
> and a custom cleanup struct.
>
> Signed-off-by: Liam Zuiderhoek <zuiderhoekl@gmail.com>
What about meson_encoder_dsi and meson_encoder_cvbs?
For all three there's already another series - maybe you can help review it=
: [0]


Thank you and best regards,
Martin


[0] https://lore.kernel.org/linux-amlogic/20260531073532.8609-1-namanarora0=
29@gmail.com/

