Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BA2C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 13:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MZTXMZGnnVv6fSvtGBrE1wHaAf9xygy4G9N0vOtIQdo=; b=a35vW4URMby+TzPXHNachkZXHj
	cRjSFykUqn3e3GkYPzSf2QYm8dQGI4nWXNPTScFKBdxr1GGGui5a11aDpoRwaaGOMFZagG8ZdFrOt
	UJPCKkn7p6OAAHBJUPGXQsDmYigE+7XMlN4ihMHHs6/YKG5gSQXyBsOOw/R17HkYkmyo1DNttz7JH
	5Zp1aCDEFxZNl4tWosH3yTAhqvWtuPHShdC8pxiuDRCNG+WA93rrRUXUTdnnB1xg52nFrR9u0a8EP
	ZIoi3cGeqeVML8SpLYE0UW8XVNggtJCl+dcmIWbnzmsTLntAwtu9lpAYh7C/DRM+XHlfG9Dy1cbLY
	jE9DQrCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2UFm-00000002H1t-18cp;
	Fri, 04 Sep 2026 13:46:50 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2UFj-00000002H15-1a7x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 13:46:48 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-6b1b1cb72d0so537845eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 06:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788529605; x=1789134405; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MZTXMZGnnVv6fSvtGBrE1wHaAf9xygy4G9N0vOtIQdo=;
        b=MNzo3Gi7tFnD/R3wW9tlS5URAEXFccOrtpiYIra+TMumhsPAXrEMLEpk66fIE2N9mg
         fBMw9k4rjl1QpOWiemMY41m+oO7idIZEA/sOSrHOZa7q8hvEXIiv4yyNYadztV8+ThRl
         uFIvy9Jtdy4GCBYSOPS6iPavxflCUFxLPL/4lN5YVl9SLvFbLzLd0hrpNfrvaZouM8FL
         wOg2RQlhgKOmWBBmPi8Gm4FguxEwGqktaS1kAQAz29IIs18zRyV7uxxqsTGJ30S91Dlx
         bDYzdKxsuaYvxN1g+ULdWTXbUr7WLkVwdWv4dyJ+jClsZi8YB/JwCyi9hzrbravEROdT
         OMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788529605; x=1789134405;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MZTXMZGnnVv6fSvtGBrE1wHaAf9xygy4G9N0vOtIQdo=;
        b=dNgEvXDl4G9tMfB36fYiWw/LvX88IwV+ZhPEYtj/Rt+pkbfy6jzLXHUjgt1fbzRUKC
         aEflMBc28mmJvmVZpXtrjZH70b7y+3xHXfNg/HnXImpgdQ3nHG9Oy92Pcp526FNO9/Od
         wITFWYfYB8/jNlerOlzhCVkpSD8G2jXcAvdNDL9MpIQsGNHzCt9Jof3Jjbz6QmdZYIOR
         tDJPGctuZNsfLPJ1yuPC+pbBptlTXDqFu4ND9tvyfdbpEwImGPORsXiqBbf1r10BamuS
         l2do8xXcuEyT729tDeYCSXu4so7b79jscVj9GSWiBo+dD/bIVZnrt62HGEIIPzbA8KmJ
         xnVw==
X-Forwarded-Encrypted: i=1; AKwUvBwzeb9h46icuyJnGsFbPJWH2Ua4UHRTEwn4YJv+lSDzRL3y2x5pQQ/03hKNJ3XJM9ERWq3VROuPscyzDLAqD/jZ@lists.infradead.org
X-Gm-Message-State: AFuF++kjIWVDxc8+MyFKqGbrm6wvz1g4FYlHG3iCWz0ZvscWcT2DWOXg
	0h+KCmV6dF7gim5JookOXZGnLwm1FA0h8vquriTZttAofk5ruXQ7Xsos
X-Gm-Gg: AYBFou2ZcjDKLZ2rLiVIPBDTFgHPzmls22zLBDUNfT6TsSxcMl2IRpIC3K1TmCzxWmo
	1NsF4/h29jPzsbahCf1XdVmJCMM+C0YAtE1RVz91LiDYDmluUM8JUbNQ7b8BBd9Y8lLh19P3w1L
	PVH8Fme/IBs1Ovs3aHX+LRAp99EP3XW+s14AsX8KoWqD2Y4dI/llwI22D4Z7QtL+0FRHP5GH6G6
	S8nL+R7liktntxX5QyPybHT6dujfdClWmbvVijo7aP08WqKbCFGJdygEgJAWCTluU82DjmZgaWT
	A9ablwqsPJkdRRC3Taquoot0sD3ZUW7aQ5/7kfRJEAIjhrvaCCgJNcTUWrW2cVBCpw+pP/KvKIl
	cXmUmtGZeKloToV5R+n3MBCQj3OTKnPxZD7GodBuUFsdWuI71jIlXBzJpxJBOtIRAYfbQnWfAmd
	iibUVNKmcuSG5BpWDwmeMl8Hn0Wvbd2FGlg4nJe5Kq7PjfPkE9VOOHC1YrZNa6MZzj11Z4vvBCC
	3cMyCVhY7fVKgNSGUSBhDAgQ6U1
X-Received: by 2002:a05:6820:c86:b0:6b7:46e9:96f7 with SMTP id 006d021491bc7-6b746e9a200mr2294144eaf.39.1788529605201;
        Fri, 04 Sep 2026 06:46:45 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:3ed6:cbf9:9a8:24d0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534d25sm7174899eec.5.2026.09.04.06.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:46:44 -0700 (PDT)
Date: Fri, 4 Sep 2026 06:46:40 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Arnd Bergmann <arnd@arndb.de>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Peter Griffin <peter.griffin@linaro.org>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Russell King <linux@armlinux.org.uk>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH v3 07/10] mfd: wm831x: support software nodes for DCDC
 regulators
Message-ID: <aprLYn4VzSTnZWuw@google.com>
References: <20260711-samsung-kp-v3-0-b2fcaba77aff@gmail.com>
 <20260711-samsung-kp-v3-7-b2fcaba77aff@gmail.com>
 <0306eaba-b59c-4f8b-9151-9f39685398ba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0306eaba-b59c-4f8b-9151-9f39685398ba@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_064647_431554_B99AB67D 
X-CRM114-Status: GOOD (  19.43  )
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

On Fri, Sep 04, 2026 at 03:41:21PM +0200, Krzysztof Kozlowski wrote:
> On 12/07/2026 04:12, Dmitry Torokhov wrote:
> > Allow passing software nodes to wm831x DCDC regulators via PMIC platform
> > data. This is useful for non-DT/non-ACPI platforms that want to
> > associate device properties (like DVS GPIOs) with the regulator devices
> > using software nodes.
> > 
> > We add 'dcdc_swnodes' to the PMIC platform data 'struct wm831x_pdata' and
> > have the MFD core assign these software nodes to the buckv cells.
> > 
> > Assisted-by: Antigravity:gemini-3.5-flash
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/mfd/wm831x-core.c        | 47 ++++++++++++++++++++++++++++++----------
> >  include/linux/mfd/wm831x/pdata.h |  2 ++
> >  2 files changed, 37 insertions(+), 12 deletions(-)
> 
> I still need Ack for this from Lee... and the problem is that you did
> not Cc him.

Hmm, indeed. not sure wheat happened...

> 
> Please resend everything or spin v4 with MFD maintainers included for
> acking.

Maybe you could take patches 1-6 now and then I'll continue with the
rest of cleanups?

Thanks.

-- 
Dmitry

