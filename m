Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E04BCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 07:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uD6Osf6Z82OsRPDVnF3a4ym/ndZXwELdg64JuzBVz90=; b=D/ehWsv3KueGL30LGCp6lThftY
	piEeBOTFx3FnF/yjdckINnZwyOEgmQ2RgfHrVajO5kyrorWKFboFRWuknzCAskIWNVVf00K3eT3o7
	mHiNtTUJlQAo2FZrfau6MCZg7AEo24rJ+42T3ikai+IhsK+am2xHxLaT+AyMesfOKc3zUwPSnQBY3
	hDFXy23v9CCQ5fpndWCoCLK+C0IkB3QXMhJ257pjy0ySpjhiGSyf7ETCVInVAcGzh00oOnTpf6ied
	WxypHURqygCdJR1zxK4gWYB7yKaM1BRMXXl5v+B6Sl9jjIdVLPLuzyovhZsneDABCWHXypGM3VrzD
	WRWkD/SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whimJ-00000001ELG-0rmX;
	Thu, 09 Jul 2026 07:02:35 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whimG-00000001EKJ-2701
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 07:02:34 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-6675db463b9so1287176d50.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 00:02:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783580551; cv=none;
        d=google.com; s=arc-20260327;
        b=CfQe91jSkoVzbwmSckzxuNTF8Yn0Z/c5MmhY6B0MHgtWYGe2aAgRl+ogNbkHbh/c4k
         Jm4/GTcX5bd5DhsL4tk1diIKJic+SKf99bF47QhwafIh4iKxzOXai0IefrjffmP2RsjK
         ct1oT7I2VCKLYsSOTVRRNIYzeY53Fy9ECF4yUEUH5ykgb5ygWn6MQtnTj/rNzhh4oYag
         DdNlpq4cbMQmbqa9KVDylX1rs1AV7xxXcDuCubr6FP2lmzE6n0uFSzxpz5y68suJl/zL
         HkU13ai+LgntEJ5DJA1fghU7FRIlcAiR3VFsImFkIKrRI5VVgInHQvsgSZJhrnbI/rEd
         whXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uD6Osf6Z82OsRPDVnF3a4ym/ndZXwELdg64JuzBVz90=;
        fh=eCL0KbG2oc+XSlEAWJ8n/owk7nH0IBTgbXoVhUir/qg=;
        b=e2+wpPgVaLlxynSzyAua0ZH+50IgdMdjpa7DxMZ1Vv+Fefcm+8UsLfhRqJxiqPXS6B
         da16I7pigxrBoPpIhi99V8hcX5emixv7gAhSCo95xaujrZSlh9+zjtHpXpf8wBrAobij
         cysH22o0Rrkgvkt7wyqe4ty6WYqCfpHg/oY/HCXU2mcmIKent3yQUkG3Hpw6rvGfLgxP
         jpUThdC7B7Kl3/djuuljNptQXmeFNZSQTmj8sVEilRqU5KUPlBJsIG0gmisd8oa8HfbW
         26FSnvfAIfVF6kUjF5fDXWmgGSpXoo+Vm2WNq39PRlHlgxrEKJDN1itn82hZMmHgcDpd
         pCWg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783580551; x=1784185351; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uD6Osf6Z82OsRPDVnF3a4ym/ndZXwELdg64JuzBVz90=;
        b=N+S55Gfs+A1UnPe+Dj8FIeTfkP68AMPTaNLAMPb62gKzOf5wJXhbshlopHL/ua5dn0
         mULJmFIstEZAqzVXugdYvDvcGEqY9rMp2UCGCwyHY1/baFKFC4E/5zcV8v2fB5h7Gxot
         I44seM/dlP/qVqV1jZTSBoMiIGNMT3qwEYrYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783580551; x=1784185351;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uD6Osf6Z82OsRPDVnF3a4ym/ndZXwELdg64JuzBVz90=;
        b=YlsOBxIuciugmtQZfZ5pWOtO10bCp+oI1LWv7OslzCRd1Wy99PaTrYDC6LSri6sxid
         GMYaNiqdT09KmkB8dkh9/lBWWao6FNoFs7o3E2BxcI7bj48mk67KlJ6fqSXqAJ31qSob
         uB9XwiJvjxQ7mcTn7i3s2sZUXC7Ae6CBoiNpH1ixXYcxGS6rLIzmkbrwa/FuC6VvZqZp
         tJsGHP1uOWGGrQlNNiz6mSC4N5cHSLz9cCk86ZEmz5nGj9Ae6FG8F+A7X63GkfmGSI/T
         O4yWtKUWcDgBlB9H2b9gk8SM2MJtICZxDMUWN9FF7C21cWLtwROBLRPcpeBNv/a4qTiZ
         rAUg==
X-Forwarded-Encrypted: i=1; AHgh+Rq4AzOrXfsuxTFAQdIqRosNZununKIAuESryTQjoZp0UdtXja61gGnL0vOAXETDBqPo016dOQk9OmKBzsLTQktF@lists.infradead.org
X-Gm-Message-State: AOJu0YyzXFj8eBnZjrXgzPafEeIQL7a2QvPjzAOXWI3Q4wKDN8x1kAjz
	JH7etB5VnF2bQiYsM25mbj78bv/sxry+Hz73X3N2QLlk/EfXFfDHWUaIl7Mu7gp7njRgKQATEMk
	c0/BrsJXMNId/GcKwcqTS+cpYqViu/uv3N4OzYQ4j
X-Gm-Gg: AfdE7cnYLdY01oYy8oyTs/bAm80FJp893DD8TUU/l2aLFd0+TOHYtxrYqDwRjtPJbDs
	v6C/wfNlq+8LLxAsqVK6or9Nlv4WAcv4a6nPGzWNgSlaHHukJDonV7yuskTklPIy8juIhwy8FBR
	X+MX2KeDC/Br9V9/A9o4yzqvTxmMIgNPeCrONxiDhVGvrNJTyQAW/eAtv4HWOXr5rdx2a+wHKHF
	oyrhyFiFIkQZX/+hzu23SnhpeRS45l3pHP5gpTghHoLV7GKuTuzoKWSGmDV7o/fKD7R4wSGuj5J
	3y4IpPOIvgJ/psVf22xq37W2BZzUm2iLV21NPw==
X-Received: by 2002:a53:cf41:0:b0:667:8b91:2436 with SMTP id
 956f58d0204a3-6679f2660e4mr3536586d50.101.1783580550797; Thu, 09 Jul 2026
 00:02:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260709063450.1615041-1-justin.yeh@mediatek.com> <20260709063450.1615041-4-justin.yeh@mediatek.com>
In-Reply-To: <20260709063450.1615041-4-justin.yeh@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Jul 2026 15:02:20 +0800
X-Gm-Features: AVVi8Cc-6951WW98xAGZ6jiAvP0W_Uwp4fM0w9OTetzj576Smn-XC53Uyv0aJbs
Message-ID: <CAGXv+5F3K+xpF8OVJPZgwd7cGJ6oWLZg3Qjh9hgdCop8bCMLEQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] pinctrl: mediatek: mt7986: register both platform
 drivers from a single initcall
To: Justin Yeh <justin.yeh@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_000232_932644_0CAA864A 
X-CRM114-Status: GOOD (  14.04  )
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

On Thu, Jul 9, 2026 at 2:35=E2=80=AFPM Justin Yeh <justin.yeh@mediatek.com>=
 wrote:
>
> The MT7986 driver registers two separate platform drivers (mt7986a and
> mt7986b) and used to call arch_initcall() twice, once for each.
>
> This is fine while the driver is built-in, but a single translation unit
> can only provide one module_init(). Since arch_initcall() expands to
> module_init() when built as a module, having two of them would break the
> module build with a redefinition of init_module()/__inittest().
>
> Fold both platform drivers into a single driver array and register them
> from one initcall using platform_register_drivers(), matching the shape o=
f
> the other MediaTek pinctrl SoC drivers. platform_register_drivers() also
> rolls back the first registration if the second one fails.
>
> No functional change for built-in builds; this is a preparatory cleanup
> for enabling module builds.
>
> Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

