Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 335A5CD98E6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 06:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=omTwHM+FxqUGDTH6qWfHVXW2MQBW72PZp+8U6Hx+ykg=; b=DVHz8MPMTVxzM9aQzybci4jkSU
	6Snwn3xGKi9PEhOrL+l9XeMXXMYECiGFc/K5/++bt0+KsotxBDYPu/ePhhbqtnZpmDUiImzLHmAMV
	yYEWF2J9oFSjd79M7kMZa0Lb8HvZ2Nm4hyE3Hucfa4LSZ1d0/jbTjuFcDHV9oB5zAyh7Sn+EN7XaB
	wsAWY9vHKCnlUNJG3jUBh2UxW5eR4JnqHLIF1B1Fvp9wmhtPH0jn8FeBzV8JO1IlKW/1MIiMZDgqS
	ZIDBLc9v53YQmfUGI83pQPjGF31q0ASNzhwqHbQUdlrbBmtY+bdyyfiWwDFvhO+tISd+R9d8LsGql
	GTcyP8ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTBS-000000023ug-2sX7;
	Fri, 19 Jun 2026 06:58:34 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTBP-000000023tF-151C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 06:58:32 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c85822059d8so1313328a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 23:58:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781852310; cv=none;
        d=google.com; s=arc-20240605;
        b=PJ9xEO9euSfKdJl/6xmVGXEp3dapR5qR6gOzwstAsL+QJPHqodScAZnxv8RS4YbHwg
         aLReaLacF1Kk52rJIS6ocIebJTDuP4iYLhTOb3VWh9cdlELr05VelVOnsJmqY2gUPCy9
         Hvm0RPBcpHefdAfwSmVNB8h+yF1JzfCzS28LHIDD+74wy0lfVCKcUks9kOZdHAXACh6g
         0Ylr5u1MHwdUyoWVBbm+Esu7qTxRchW58iC0ALl3fjmYxpLMi1mxcM8vHtPf/gDqV29h
         /4AIFkruQ4BUSoaSjwJyQ+XeOqSMwiAtI9LY9Os9/2KhXdoQ9/jy/vkdRbwlNTz/AmtD
         VSxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=omTwHM+FxqUGDTH6qWfHVXW2MQBW72PZp+8U6Hx+ykg=;
        fh=t6PvHh3OxFsqp2PkqA0pD3m84BKPmnDNx3mdxbDPdXI=;
        b=UJpCI36kf76JUnT9lZvh9zQ8F+wj+E9uGzjaahFMh44/c3fGnhyMeFwqAG7LkUNS+p
         +TtAYMKV3AyJg4tu9uV+UoxOVjlq3mbRXKICIrJY1CdxaukG/e7IA9Z6ZTrgV55FbcsD
         9qcgMp1H/qm1FKumuxyZWbS4Uo3B+Z2pljgkUWIQzklG5haKCxV7ScodCrYacjVGY0X0
         SMjXrpjXBIsp7CA7QMPiWTkfD0vpLAFPHDOtE8N82JsdxZtDVIvo2NG1SkCPDyNM8QZv
         ZlNK1LpyqTof5/COuKZq/XAmJkBwHehj8O6h/4IYEWiu/hmEW/x4EJtAvnkl7OQGjVo/
         1O5A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781852310; x=1782457110; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=omTwHM+FxqUGDTH6qWfHVXW2MQBW72PZp+8U6Hx+ykg=;
        b=AMdtOvQqU6Eh+nkmbWFtcz5Qe+xhfBiFOew/nXZ2OksV2d+mfiov98AZFw1JFRV/SR
         mkWgoZgXNrSa3OEJ1x2+AncKWwaucTT+lGRWs/4hVmLQgVWUgz3qYwtVRw3J+2cucvmW
         6I1B310ujQkb+yi3uwUgq6byjDEPexUTeDt9cKjRqMAYh2Y7+d/iB2oOATvkUUObSreZ
         haEd/Gwz4tOBhtjf8Nrd/4JiIoKvSbzRddiHjxFuMiE9cAS0OzgqHDv02jL5mMVTO+SQ
         rEo1spGkr2ew4BF5shfz9eLsV6v1KZubBdPC+26bBj4q0bXxOh41GizA86TGBWGM+EEI
         1z+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781852310; x=1782457110;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=omTwHM+FxqUGDTH6qWfHVXW2MQBW72PZp+8U6Hx+ykg=;
        b=WoZo9ydcWUNqfLfVb4LxG1ak5l12CP6dzIFrR72q/wDC2uxGS/yopKSrbDnNAIET6k
         8W1qNnsdKFqINxYiFvaYLnt8Z0bh3BRVlV+V5GxnOnBL3HQVVRgCpATXC7NBD13BMoSc
         Ex20zKOSfxt7LXI9ZTh81R4ppBoxfZiR92CHNuevBvM69K5qblTgBVla+leun4JvI4RF
         cx2f1IdsB5Fk5TPe3edKwW6eAqXAbx/TWl59RIhhSXmAiz82a+DMNQCzIYlxDWK290sv
         eqZDyi/l0WN1UUHVmrXVR2oqEyxzmE8Dgm/8qDpTrATLqvD2BaDzJfdw95HXE2j5wTQi
         hgDw==
X-Forwarded-Encrypted: i=1; AFNElJ9335mIE5MnXBUBW3anQd8Fxmg0ubFyg215nKyaYw/gORJt/2NJHPbeC3pACFRVljQQgsxSA+RPpAdJEV+9OT+Q@lists.infradead.org
X-Gm-Message-State: AOJu0YzmLDjfZkXcnhX3vW3GdEo+fJPyDUm+9aJKdwffUoRobIqWKHVM
	mGH1IfZd1q0fE1Egidyj6P7EP6I4B9N0cPa2zPl8iogsS1l9oThZkbW5XJZS9UEZyuSHuxMzdIs
	+cNfFdWJxs9E1TZa010+2na2MvtIWVq8XREWA
X-Gm-Gg: AfdE7ckoisagYYnOaPuIbqM+Oqw6WoRygvfsOlf1GBrfR2txROJ+NrLOSWideNdt2At
	kprdb8GznD4J4g2v+7qL/1awSFIRaDPsLL7A9xbpicqcaT6QveAHvaYmLqZAB8IMPxO3xiMlhnD
	OyX596ShvFV/RrYTKSnwzvYjPNlnOqkjBRNrGzr80/2qNt6qzLjRsROHDUfqnRzcaD9IInHQSUs
	ICSUDae0oxzyk+NkNnM/ApNiqBlzp8c9nTOFGybouaUHZItQ4Iu/Ze8gi0XYKONWCbsQj/OJIeH
	xHa91DQxCAka56JDdg4e+1wXPps=
X-Received: by 2002:a05:6a21:1493:b0:3b5:6b5a:4f29 with SMTP id
 adf61e73a8af0-3bb33c411fcmr2889534637.30.1781852309935; Thu, 18 Jun 2026
 23:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260604033554.96996-1-phucduc.bui@gmail.com> <mPIrpl-QRw6_Q9DZcTQ5xA@collabora.com>
 <CAABR9nGEHmy4YSqFSyh+gqXVwNgpaGOjqBeUZyHBmMibHwvMxA@mail.gmail.com> <D9b19fqJSQK5FO2BflNEKw@collabora.com>
In-Reply-To: <D9b19fqJSQK5FO2BflNEKw@collabora.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 19 Jun 2026 13:58:18 +0700
X-Gm-Features: AVVi8Cdm4erPWecisaOWEQ1-2N07q0qf6x9N5Gw3YmftzXkgKtw2pGyicktpxkc
Message-ID: <CAABR9nEJg2R9dkGOrn9aZ_b=J7qMU06UKv+HcwdLmzckBoGL3Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] ASoC: rockchip: Use guard() for spin locks
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_235831_293619_C074E3BB 
X-CRM114-Status: GOOD (  15.59  )
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

Hi Nicolas,

Thanks for the clarification.

> If you want to try again, do so in a way where you don't have to indent
> large parts of a function another level, it's possible and the diff
> will be something I can actually read. Remember that you can place a
> guard for the spinlock in the middle of a function, and it'll only be
> picked up then, which should reduce the need for the scoped_guards in
> this. To avoid having to manually do pm unwind (and therefore require
> that the spinlock is dropped somehow before function exit), use the
> runtime pm guard macros as well. That should simplify this immensely.
>
> Last but not least, please run things through checkpatch. Even at the
> default options, it'll warn about the indentation level. With --strict,
> it'll also tell you about the braces. Personally I just use whatever
> preset `b4 prep --check` uses, which usually is quite reasonable.
>

I do run checkpatch before submitting patches, but I wasn't aware of the
`--strict` option. I also didn't know that runtime PM could be handled
with guard helpers.

I agree that using runtime PM guards would make the code much cleaner
and avoid much of the extra indentation.

These are useful suggestions, and I'll keep them in mind for future
submissions.

Best regards,
Phuc

