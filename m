Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE315D49C71
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 08:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1PP2wyM7jv0kDdb8k1BholOJdOLHYLeXLghCq7d09N4=; b=UjjPVy5Ly36Kc70bYGCOT8iHBi
	pKKEqCDWkbg5KoZbQJYtftH3FF/XoOPDvumjvV1QhRfxoCBt/985I6/QqY7TWwqfsvhfzskKcZLw+
	zP8p743nPNbjPH5KDEm4hT5jrZAkxJgyt6A1ArTIgBa57+xBKw+G0WeAOuBS4ZHEXRFFUqnxcdBIY
	99bAelyCc54eiCCYLJ49Mqoz3ovBR+cKxHF+ZI19Suf9wERvVrMcilki9TvHUAGB+sZaX0S0j0EQv
	8O1a1EpIdq+5s2Jca4oJ5DOrBm7x0DrZO4lFIY19EP7+De7q9AdLaReoYnpplmThna3A5XgwcRZrc
	pesFJe/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljfF-00000001C2v-1B8R;
	Fri, 30 Jan 2026 08:15:37 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljfC-00000001C2a-35Wa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 08:15:35 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-124a635476fso2748771c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 00:15:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769760934; cv=none;
        d=google.com; s=arc-20240605;
        b=kTeBfKDzVkC9c5OJbVg5W3+lc3DjkOL6zI6cAhAkyuCl0h/Oc12fvxkrm8SFieEH8B
         D9siP9IxPynYIdkSelxi039o1l2+l/Yax+WfuoZ8W3IZ9hT4FCrpPiat5vk8yOnQL17u
         dq6gmBbKkrnyghxUq9g95g3AZiIDOJymsbq1u4HkY7sqI5m1A8xXzgowUtNRFv4JzFJM
         oE4tImp4exsiydn+0bCvR7wKEEFi5pc7aqe6NtDltPK0leNPhMalEnArWJ9dMJLLJhSm
         WJOTNVcrF20iFCxxJleZI4oY0MqXiBSaXdWgvpd+i0KX+VfAED8SmM7YIq5X4gYOsf9z
         5ThA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1PP2wyM7jv0kDdb8k1BholOJdOLHYLeXLghCq7d09N4=;
        fh=GwrC74p8eDBC0k/d2Hk0jYZ+wd4sfXGLKJtAVa59T4I=;
        b=g7wW7ACwPqdhyTrNjWX4iALk9hkaNijifb4RuWmwoSZdhX3d5f2hhP8LJ0LmjVFUM5
         dQFfDOGBHxwq3QDzpmSzyzHqOPY2krZroQ4uxKz33+sr2RG1DvDad1ZLoyVDJIHvRldu
         nAPEVcbvB1WnwpQwQx//6qvH9/eM//gJzWBp56jaEsh+pubSM1PM2qeGeURrT3GvB4uk
         3dObmD6Q88poTbdAxoXpgRN/DaSmUTDq4Lqm6w1J39LyMVxQTrYNAo6gst0sy4ijP0qw
         /7yZyOsro3jjaMh4L5GOMH7aXR+942CzduXRq/bcrxsBinr3oiyDuNA6AIe72L/JLpf2
         EwVw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769760934; x=1770365734; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PP2wyM7jv0kDdb8k1BholOJdOLHYLeXLghCq7d09N4=;
        b=FRt1bdOGoqeO7d8Kj3qFXZKWklw0fGo716ElJTUHp+gVQzakl6ht+6XsnO87EIwnKe
         7ymXmob1w29Hw1FsK48Rw7tE/mQhwfx93bczAK0+7/+8mTdtzToI5d+DrWpzunKCy2cq
         VpjpIqJeywOS2e5gpDO7YQ/T4WPnlbk+aMyPrllZpuXYQPLkqIlnuBShGZj05aGPxZOi
         StWEOpVnfVMRyCaShj2MiLQ8/yMBOgBHxNVCrRd1stMsEV+mygfL7wGsUcwN7br3EIVp
         ihZBSa6E3P/63Q+FeL2hu+ZLZw+i8S46127VxAZh32U7pXKQp4w1XjgTasZh/33+xLdV
         VBhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769760934; x=1770365734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1PP2wyM7jv0kDdb8k1BholOJdOLHYLeXLghCq7d09N4=;
        b=gRt8bLlbdISA1ilm1+uhiYq0l7nN/Xjh1D9jxXAobNDfW0ZS2i3q+8ls9xRUnfpJHc
         guHRe3tQuUyQyKRU1y5KdYoUs1PJKcqwH11IWP0arcXubpElVCOUXQ7KOE/yS2N3DTnj
         pdFRSRjnPEtCcbvupzO91fwGc4Trg1AzWa+UDfd98WcBXf4EQgjGTEs0gcjYxDKUnjZR
         x8DQTltK7DNSbmqonis1veywy/jQkL+Sk3qMJP4oMaEEpOUYRmfxgosTYS3/NNkQRH5O
         aNMVx6kpi0Z5/QYxqXDESsfmy2q+oeSINmiwGhcPtCSdo6c6MU8NM8ysR9t9dx3ULURZ
         pXfw==
X-Forwarded-Encrypted: i=1; AJvYcCXasWthiJSG8hJjm5FXJfSXbEiYZAjRxWmytySTDP7i9EbLt+G3AXkg26sSnlx0eauiUI+Z2SNBMosGPedfiLEj@lists.infradead.org
X-Gm-Message-State: AOJu0YyFAuqT4c8J9UcFndRMKwUgSLTKrIsSY+L436rxgQX9bFP1cB7M
	RGVwjinlks9NuMR4UUF8fT4mda6YcwJGuXjLh3oIo3BChMhvjGkDimOGd+z179l/yJ4cTYNsmVN
	Nk8SM0ICH6uBTakybd6yQ42Xbasa4ceA=
X-Gm-Gg: AZuq6aKq4zja2Gg12rXfy7HhxN3XE2v9H6BvQQQxiasQ5r8Y9X/zPn9Jguc9oFI5sSu
	RqzrGIlDQs5aVknmnF98+fE+Wgqfo61/O7Mh8ls0caee116qC6Haj8zezpxJksUkNODjWZj7RtJ
	2fvGYBkI4X2f4y5cejx9ASYfKgQJlgGMwy6wOoV/rz9eUx8Zo2iWjqEGh9DhB46BW6wfsYo6pcv
	Ipnb9AvfvxID+zW8N2l9GB/2oiSUBU0bBm7wB1GLKzWlpgqUL3415ZoewnwFYzsMzUkxJG229fB
	kFSXAd6MxIrTzZT0+52kOqS8YVp+LhZa6UwsZzwy9XsjSLwpt73VcPQh1JGv5u7m9M+yLDJDONA
	21EMuE3PteczuEQ==
X-Received: by 2002:a05:7022:6190:b0:119:e55a:9c04 with SMTP id
 a92af1059eb24-125c0ff2590mr1058964c88.32.1769760933549; Fri, 30 Jan 2026
 00:15:33 -0800 (PST)
MIME-Version: 1.0
References: <20260130051107.2130200-1-xu.yang_2@nxp.com>
In-Reply-To: <20260130051107.2130200-1-xu.yang_2@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 30 Jan 2026 10:15:20 +0200
X-Gm-Features: AZwV_Qhfj2kYMNnPMsstGvF02XqNFQQbyZZD7PPVRqDDkgSk9_oYbnDVYaLdLH0
Message-ID: <CAEnQRZAcM+OquwS9Rwh03ca5sbofv7DOePF-0NmB9asrMR_Tew@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: imx8m-blk-ctrl: fix out-of-range access of bc->domains
To: Xu Yang <xu.yang_2@nxp.com>
Cc: ulf.hansson@linaro.org, s.hauer@pengutronix.de, Frank.Li@nxp.com, 
	kernel@pengutronix.de, festevam@gmail.com, khalasa@piap.pl, 
	benjamin.gaignard@collabora.com, frieder.schrempf@kontron.de, 
	p.zabel@pengutronix.de, shawnguo@kernel.org, l.stach@pengutronix.de, 
	linux-pm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_001534_777821_22DFAA6B 
X-CRM114-Status: UNSURE (   8.05  )
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

On Fri, Jan 30, 2026 at 7:13=E2=80=AFAM Xu Yang <xu.yang_2@nxp.com> wrote:
>
> Fix out-of-range access of bc->domains in imx8m_blk_ctrl_remove().
>
> Fixes: 2684ac05a8c4 ("soc: imx: add i.MX8M blk-ctrl driver")
> Cc: stable@kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

