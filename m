Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC78DC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 10:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BRpIuFoFTSYDMCEFJGiUusnifNbms8g6CYYPzdMnXGI=; b=yc7aJFMSB8MwCnxRSqct3DIF6p
	1Kn+AStPcTRAj21yF0uAwqXTV07HKgrYKwjaFR/05T8Na1a58lfbOZckEZv5x8++riN8lGzGLr5rW
	eq5eOiPQ4OyE2tEQS/k4yrZWjF1f3+j8hsLyJXJcPIl2EoQlXPPh9+k7VcP0/yfrDyXm5g3ElWzLv
	Ao/+SAx1jm+2S5mU/UYXtxZpPjHTSxRVauk3tYYgcjNC08WNbCxmZ3KoCTJUgXdWsb55INvNa/Z2c
	wQ785NUaHfvqXOtzAMoqCwSo9R96mbWja8Pe272aWRxWNzZMNUs8xP5xhNDTPLEqNQH2/AXy2IbvA
	ysy51lGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA3Od-0000000D7ad-1nlF;
	Fri, 25 Sep 2026 10:43:15 +0000
Received: from mail-pj2-x0d.google.com ([2607:f8b0:4864:39::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA3Ob-0000000D7Zn-23dz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 10:43:14 +0000
Received: by mail-pj2-x0d.google.com with SMTP id 98e67ed59e1d1-3a0b89592d2so318777a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 03:43:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790332993; cv=none;
        d=google.com; s=arc-20260327;
        b=Xhuv+yK40jCc3ro8PUKaCepQJ2jrrBU5eOfiAROGXkXu1UNb1ivku4cqKQKZLdhJvz
         cUcmao9kLVhCBmLCc7+UDVUsWHrq3MKHx8EdpUDWbgRKND4ojji4Wm115LXJ+7qE9sN6
         zbKxN9xE6q690xzGuNi8TMKm2KBomoZNFJOOD+7hx4ZDlOPONUaAvdzgGqIc701xkvoZ
         5RL5kWDqHVxVZgGcdGV2sQKaixZGrysU3yv4x+iUWQMwM9xEeY4U1G6b2hm9Fqmn3zRe
         Mt1WEHQi9qe2un6zOEPZYRC3P8xSYqUiEYAiIf+K1+HBS7f6eUk95fyOkIB7f/e2gkqu
         PXUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BRpIuFoFTSYDMCEFJGiUusnifNbms8g6CYYPzdMnXGI=;
        fh=tY7Snp8luyYAsNx4Ox+TGC9QgzGL4to5BLPRoJ8Z1Yg=;
        b=G87FIo6+7Fzp0qwOC1w9tj0lFRhWL4CtwjnoosAerO/ZNfGAJO2+6us6quw4tkuPhG
         Bvh9llWJJpT+xe69qmz/g9+Kd+KQLuMiPsu3bGlBRxxELh2RNcXwXkmE7hvb0zo+NyBv
         UxbLgxUbyF/1vqj6pCvgYyS8+CDRdIMy7Uh7828d65tkhid70HGRa4nKy20K85byAnjz
         Nyz0K8I9unbbIB9bVVBJPcl/XjrtRUpqORrf5P5IViQwF/9mwYj0vXErUSd7qrDqq9G3
         70mpcoqGJI+zax5uncjdBqobwMJpV8Do1peex7UNbQUaepbybrmbnaWDgmmrwkT1wcKA
         T3Cw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1790332993; x=1790937793; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BRpIuFoFTSYDMCEFJGiUusnifNbms8g6CYYPzdMnXGI=;
        b=Qils32WESQC4ngyNDh7SbA1BhucZW55xuNlr9sLkNlJf17Ma2AKYpt1idtkJ/WiwkL
         QFhxTIBr3Tz03WFJ64lLUVCaRsqmNDxbFCpJM3st+xk72icIDO5mi8M76qiRv/Hi/3D+
         dysoO6lJqJkLGoYIfmwGNN2MHyKmnKgIBk2kFJz0sZxzPFWOXbxMSi4WfVwAJEkmfpDJ
         pKK496ROyqtgRFHH7K5Bh1fXq0m5EKXKOcTGcJejClXxFOVLrsNkkWGtTgLRjL2VuBHQ
         Afjd/p7rVQcDgjOkQWHEAo5tJRbiRYibKTNwjuxTSqsLT0R6W0Zr4UehavxhhZ3J7llk
         1BCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790332993; x=1790937793;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BRpIuFoFTSYDMCEFJGiUusnifNbms8g6CYYPzdMnXGI=;
        b=spMufTA3G1PUxkeqJPwUfBfbm92rwmSmbrUV0eT9G7M+1YlYcGGqt5v6ZXUnAEm22D
         NWTH/1dA//BenPVr5irJ9pJ93oRuaqtcG5jW53WxIOuNMnyrWm9AIKzQmkbpDUremvMH
         5K+zuzqE7QsSh7z6nfNl6KuoBz/bjVJ+SAWRW0q9QdE5EzWYRbcJZ1U1TAOdE6/Qf7Ni
         8jLgvcohqVEmR34fzHEFK5GKXdFBFAh20pFXyI5770Xr49OD7z5ih7DnpsrMKzDYglKZ
         xzhGiOrHGBKyghwVWBANUK9b6IyQ+DSlzdFkJH9spJQ0jMFpegQS+QVxp+TwvOY/tJdo
         049A==
X-Forwarded-Encrypted: i=1; AKwUvBz/ggLOv1U/+hiBji1tIrxbfMHjDquLcJJsswQEHh8d0TjBkquX3UaEXvDj5aHBRY6ld00KzaCb7jVLeOXkg1rN@lists.infradead.org
X-Gm-Message-State: AFuF++lwP4hK4IFu8MFOBOflMDjzcvuPR/ItJ1RityFGNHl0JQw6+h4U
	T5LM8RfHmsEnMfzhY+TOmmQ/35j5pAJIC3hfyhTg81ZRv6ZmOuLJDCjmYdEtzjwy2k4yeIFKLt+
	x3MVqmFI88Le/rEwoHritKUSUcNOGXJnDd0T/8K7hXQ==
X-Gm-Gg: AYBFou1XINhxXSkpkHlUO7WTF0HW7wV0PMNWAsBoj2OMivL16FcR8vLP4IEBhjP5lRM
	3+hJWF2FcBjx5UchLxibs3EFmbM4LdKhjhC3DzvOvfyw+mqSg5vS7ZyUYoHJ99AmiBi2qDENJ+U
	FCO1R6TY35hUR2pSHKtEfHmGfBNl6VaSxWY0w9FuF96eEQdtvCzbzxIEJE+SA7TKYVCLektLIN5
	S5+rUX6SbriGajHQ/amXYbfdps74k16nE4AzfQJY8zJTS/g1yf61BP2my3hnkzWKaXqyCnl35NT
	3BtBkyhRawkCA1GG5fHMYJSw1FYxx/jxzr+uhr+x5+wbv7Hc74klHYkhJo0pmwd7QA==
X-Received: by 2002:a17:90b:3d46:b0:39d:f317:44cd with SMTP id
 98e67ed59e1d1-3a09860dff2mr4452158a91.14.1790332988129; Fri, 25 Sep 2026
 03:43:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260921-vrr-limiter-uapi-v1-0-2fcd7d011646@collabora.com>
 <20260921-vrr-limiter-uapi-v1-6-2fcd7d011646@collabora.com> <a5bc012a-9b9e-eb2b-d67e-a91f2d93d6bf@nvidia.com>
In-Reply-To: <a5bc012a-9b9e-eb2b-d67e-a91f2d93d6bf@nvidia.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 25 Sep 2026 11:42:56 +0100
X-Gm-Features: AclHuK-I3v9LGdL8IGkTOXDiWq73AU-KwLgPcsiWlNH5IITVHFCCiS3M3P2Jw5E
Message-ID: <CAPj87rO2+oSA7KtocG-M1hqgQTJO=3Qxmg-OMC5MmOLaja_kRg@mail.gmail.com>
Subject: Re: [PATCH RFC 06/25] drm/connector: hdmi: Add VTEM EMP generation
To: Vidith Madhu <vmadhu@nvidia.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	"Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, Leo Li <sunpeng.li@amd.com>, 
	Daniel Stone <daniels@collabora.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Helge Deller <deller@gmx.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com, Derek Foreman <derek.foreman@collabora.com>, 
	wayland-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_034313_555429_621DA108 
X-CRM114-Status: GOOD (  18.03  )
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

Hi Vidith,

On Fri, 25 Sept 2026 at 04:49, Vidith Madhu <vmadhu@nvidia.com> wrote:
> On Mon, 21 Sep 2026, Nicolas Frattaroli wrote:
> > +     if (!crtc_state->vrr_enabled) {
> I don't think we should use the vrr_enabled CRTC property to determine
> VRR_EN in the VTEM EMP. Transitioning the VRR mode sink-side typically causes
> blanking, and it was discussed in patch [03/25] that drivers should be
> free to handle vrr_enabled changes as a seamless switch since it only
> concerns source-side VRR state (this is how the NVIDIA driver handles it).
> Maybe it would make sense to extend the qms_enabled connector property
> introduced in this patchset to an enum of {Off, Gaming, QMS}? This would allow
> a standard path to control the VRR state on the sink, separately from
> vrr_enabled.

I remain cautious of putting this amount of policy inside the kernel
and/or left to individual IHV choices. It's relatively obvious for
NVIDIA and AMD to say 'we'll always enable FRL/VRR to smash the
maximum rate (unless it's contraindicated by USB-C bandwidth somehow)
because the power burn is inconsequential', but if you were MediaTek
or Rockchip you'd probably make a different decision. Then again, if
you were an MTK device living on AC power, maybe you'd make the same
decision. Or maybe AMD would want to make a different decision on
laptop parts because the bandwidth is noticeable then.

The point is that I don't think we should bury this down in implicit
kernel state. I'm with you on surfacing this as an explicit connector
property. Possibly a bitmask of modes the user will use? e.g. {
frr_only = 0, maybe_gaming_vrr = (1 << 0),  maybe_qms = (1 << 1), ...
}? Or perhaps just a flag for whether the link should be negotiated as
wide as possible or tight to the existing mode params?

Cheers,
Daniel

