Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43C9CA5FAE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 22:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2h/b/s1hyf+hYHDXMhDwTwcRRjLZP5znf0gW0N5R0m0=; b=v0yi+57vHwsoLRXOrg1B9rr2fn
	1ec5v60hpFuXNktSm9z2uebGrd3iyk8Su6Gqf7mSwUai/NhzbT4LHnq9lw4i19TKPN0dlJ5lWepp+
	7UDekFyL1T8C+sbWCjy0HvpOmhBrFOdEL+kkApLQ3ux5uqB7KzR1jUCs3QrL/WDJWp/KizSmeKsQc
	+Sh7MxJ0skFs6K1Jwj6wF6wImMNsNsOuh3Z9KhJK0jiVHbcqBHfNa9p2vefF5xeYkl9LemWZyjg5r
	ZdUEezQPLc/15HwF+f+s8hoUTSM+xDqGqDcOb4ky2EQSl8D3QVmvP+ncob0vE19XwGdWNQCqUq3/Q
	CmCOdYAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBgCj-00000004h6R-2f7b;
	Tue, 29 Sep 2026 22:21:41 +0000
Received: from mail-qv2-x0d.google.com ([2607:f8b0:4864:33::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBgCh-00000004h5U-0RX1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 22:21:40 +0000
Received: by mail-qv2-x0d.google.com with SMTP id 6a1803df08f44-9178b9ca7e8so9044296d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 15:21:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790720497; cv=none;
        d=google.com; s=arc-20260327;
        b=eLWOaJRDfwf2o+e2vyBZpqmbv+8gO3wMTPOzkWW/S5HVKBw1RaQ1fXjeVXDKwGndFB
         RFBXeb2REX3/mGth754nblCT5NV4iLZUE9gz0Ch0kk5JVBKNEFaxIrbF0sTH66qi5ENO
         y4MKtgT2XidC0zfE/0gcZ1DRxVz0OLlNYguyVuozLVzZ52gPpaqip1aems4Ntbxat4VZ
         MUEJjnXjV7ErGR8SEYJwGHUHbstd2deow+AtgJm4GB3O1JVav17hRwyo8edriGEhiGAC
         18TlFqa15QoPao37LWq8f1KLPIiGhvf6xBBUOKMWK4xilNYPeXtfeSn0iYkKDX8q7PDp
         A2Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2h/b/s1hyf+hYHDXMhDwTwcRRjLZP5znf0gW0N5R0m0=;
        fh=gW+iWAmlzkz5L+DpB8/PUXB2MXLiqLk/IOGSXBavuhE=;
        b=bL9Wu77pbOUlUn9vs/8VGaM14Uos9bazOvV2hfKSjPK8BVDwRknmX5x0vgvF+3eW2K
         AhlxMHn81W09n4MeaPQOj5JZdcu/FmNYjFUVDIRpYWrUAuPJ4XZjdtT+c/VMBFREMfJG
         U0Js29FA+P5PT49XQqj3fCro2V1NFZ7vDgicwR9StrBrc23mQKp0rb/4SWmp7GPgcWwV
         8BEcsavObMZBDqStpk2MfAKIEMKHxgRwNOYt74yuvqy3N/v5zkvWyHWwX1pSaDPNr7n1
         B4euAOL2e0zsLXH6TpzJOj3LA3p5GcgV14gKZ4go4p/xY/0zsiNJFWOm5mu+AcjgSM6y
         z2Jg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790720497; x=1791325297; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2h/b/s1hyf+hYHDXMhDwTwcRRjLZP5znf0gW0N5R0m0=;
        b=Aib8cZwc6l8Ks+hH8g5h5/mds16brfDsVBTol2nl710u6Lr4Zp14UwHmZWmj/JknVa
         wtzXBNPmfudOX9atkiEJRcQve1mv+77aXs+M89ROmF9iAqVN7d/zZ/J5jykLOY7asmsI
         ro7mDAYKQlxOEjULeGJsWqhGpb0SlC1l2roRN8poMLK+bDxZHMiXkJVkwSuCNuyIZKbk
         RTIHY7AFouKxu6ffG9ZvUwRxUxIkvsIKYF3TlVt8jIfOlva1faeZM9EJGR8UI283JYTa
         p5XzMof6q7mOeWLmh8JaWVMbjKglNNe3p2w3ia2V3SnSnBiPJlDOvtxUqQhTVfbpqB6Q
         RJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790720497; x=1791325297;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2h/b/s1hyf+hYHDXMhDwTwcRRjLZP5znf0gW0N5R0m0=;
        b=0/SsE9/OislGRBRfmnokOWMocDiFZe7la47NphtZb1H/4ZySI/4lm+u5W56GUuOnjJ
         7AcgxJqBhwVJT49hi1pbOh3Ol2JnrwZl0k1Pyz0z+4gzjx01QaUM9OgbumT0P07XSiFI
         aIP+oEev851oll7wY67LNUk9tcUoLhLCjuslNJeGEQC7NkyMo3xP0yozIyT0qia1e4IR
         FITwVag7Qi9nxoVRpbIrv9kCEYxuhTS0g/hi+e0YyjSqshzZumxqxHWXg67kcKX9kseQ
         sYf81rYjSuSSxnD/rpv6mQucPZRlCeWcldD42y0a4XbemqiqrG2ba5HuZC0EvBVThnXH
         3LgQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5x5LlAJOKEVpVg7X2i68Pj0+LgADNLUXsVO7P+Lt04hvWG+7bQ2VmL0Dn0foRjK6U3HRC+1XINrBUOrpQllJE@lists.infradead.org
X-Gm-Message-State: AFq9FYKShQe70c4pb9vX5qGkE6VNNNRuZF/HmNKD/FjPxDuOmTdpg1FP
	Gicsp35lXY50bTbbt+gGCeTXVCc7ToC8mNfTc0sjkRW5Tvc4FgcIQc29smgju0c62RKK25H/8C3
	9WT6NiMQwDJru5jVPbJKbMoI68ibsotE=
X-Gm-Gg: AYBFou19LpgI5OSsOWXbqgqYOS+2sg1q/YpnK6Pp6ahNfesPaYKB/DOuPVHm2veTrJ5
	SSYVWduA8kSYUbC2XEd1Ykt0/9Us64WNjVuO8HJDNSyHHL+2bjqzBY+gboFVydF1GYGx6UYWRhK
	bLthLiZ3gPsyI8bYkaNzpNDBuALeS1HWCXz3TWfsa9NqKAz0cdxNgKWw5l9wb5QHoXzAI4Ki6NL
	8mRZbuJEp/mWNDE+6oVfmFe1hT2PmpGWidDrYboW6bNTRPzujH4LU7rElNP4HsStIYmDWgMYVaW
	GXJuOB9tiNeId+LIaxjDaE21rdFq8VUa27AoZSUSxP9H9F1IcLEXiN0=
X-Received: by 2002:a05:6214:3202:b0:914:4bd3:d984 with SMTP id
 6a1803df08f44-91799b4bd9fmr11450236d6.34.1790720497177; Tue, 29 Sep 2026
 15:21:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260921-vrr-limiter-uapi-v1-0-2fcd7d011646@collabora.com>
 <20260921-vrr-limiter-uapi-v1-13-2fcd7d011646@collabora.com> <1b722d71-93d2-93a4-acdd-bc02b9a36f95@nvidia.com>
In-Reply-To: <1b722d71-93d2-93a4-acdd-bc02b9a36f95@nvidia.com>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Tue, 29 Sep 2026 18:21:25 -0400
X-Gm-Features: AclHuK-WotblnMwdXvS53G0qNfl2c2x7OSON_0NQQ-TSXMtSHUSKVbt3lVkA9wE
Message-ID: <CAFZQkGyvxO7Dty4XXJ89FfTTeD5YfirX=16tMW2Mzds7A2_bpQ@mail.gmail.com>
Subject: Re: [PATCH RFC 13/25] drm: Add VRR target frame rate properties
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
	Andy Yan <andy.yan@rock-chips.com>, 
	"open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, linux-kernel@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
	Derek Foreman <derek.foreman@collabora.com>, wayland-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_152139_160021_333363D9 
X-CRM114-Status: GOOD (  16.58  )
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

On Tue, 29 Sept 2026, 15:18 Vidith Madhu, <vmadhu@nvidia.com> wrote:
> My understanding is that flicker may also happen if the refresh rate
> fluctuates significantly within the sinks' range, although I don't know
> how common this is in practice. I would imagine these frame range limits
> would also be useful there to "dampen" the fluctuation.
Judging by our user complaints, it seems to be very common, and I've
been waiting for this API to do exactly that in KWin.

> In any case, if we expect userspace to use the frame range limits for the
> purpose of flicker avoidance, it may make sense to expose a read-only
> connector property for whether the display is susceptible to such
> flickering. For example, NVIDIA G-SYNC monitors are resilient to this and
> it would hinder the user experience to unnecessarily impose such a limit.
Sounds good to me. I think such flicker compensation would need to be
configurable by the end user, but having good defaults (and being able
to simplify display configuration if the driver gives good guarantees)
would be great.

- Xaver

