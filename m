Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4759EF8A145
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 08:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rHLTvTB9rDNh9jJv6Ebk36+huSVLvHgRUe2zgyE7vag=; b=EMwodnofctex+BNxtaZHTAWHC4
	gCB2WWgmvccbQt1tQ5bD4fq+SkG6U2KNuvpyhub3hLHsWV/SRqyytextYqPD//ieybvd5wf6l5d7z
	0g51NHRkwnv33kgPWjdxsWpULe0PKodPmwZiFZo0eRJyZMidTQWkgQwkSjNUI/cfMNdBKAd4u7MJ2
	DIDzhy/fFbJO7/y/6Y0v6+rKfkqz9tbPE17rCO2XX2lxkIlHstOZ6QofR/ViDi2afI53R+vCl//kQ
	hFcepX/81AtGiJPvmI5MPj9bLPDssqnr7JwGuymEfcH6bcTY6bHqakVZSwLzkeRMXCi1BA5VdT+KB
	A/SiU0rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDIZE-00000002D9x-19ON;
	Thu, 16 Apr 2026 08:59:20 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDIZC-00000002D9Y-0QBP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 08:59:19 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-6501725d888so6138762d50.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 01:59:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776329957; cv=none;
        d=google.com; s=arc-20240605;
        b=lKeqT0WnQmAPdPsIyDAClQ/4yBfhFUyr5XSqLwE33PxhgRlvYBObmeG0U11GdxInOt
         /9wJPHdINF+ReA1Jv1jO6oftnkS8wWEQqRldApapmdGuMTUCJWos6wu2Xxt3ExBlGgmp
         Y3TmX923DMo+CaP0lbGAT8TAdF5IJ2pWSgeNSeZmg8VYZ0bGkI6Sn6ikyKUIkJ8hjL0M
         5u9ru4PJBfHsa81ZhIogN+U3AZbtDatXPLafDsS7yDSl3E0gSPCHTDi7kydTHF/p9U8A
         XdjGW7x/+qhdnexRx5yUJI5f3rHMzP6KBIdyLM4heVqkI4JLgbx1jju+Somi1YuH0cTX
         5h1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rHLTvTB9rDNh9jJv6Ebk36+huSVLvHgRUe2zgyE7vag=;
        fh=rDlY9b0PrGRygDCguojvg2brvvp7QVUUQU/7l5fBW8c=;
        b=PzpY2r2zeavLZQ4FfFitfizec52FQXyy/qIRvlNwTQMwOOtVnkTtlV80DY1bAq5G5B
         V55en/ednmFZY4wLqIYe5HM4LcOZwMY1NKhhpyvqymDGXph2zywIh7xEFy1PN8PqgvIl
         vDKscQQqrWVjGNC29XoZBadbFz936Ay8geqP7B2tQcmJMOKz2NXYywA8LRGq/3ARkQ2e
         fcLWbrXupVbyiVyFI6CAmqDnfBZEJpd+i1r4BVyao9NF/Dsm5bXZVUoLuKmYuL7Gpfo8
         9HDSjhDCUwsr5JmdQBZHY5LrzKUZDsHGONkQlqTVEO8cPV7Kt6vzNSmqa1l7syQhTgtw
         8Q0w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776329957; x=1776934757; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rHLTvTB9rDNh9jJv6Ebk36+huSVLvHgRUe2zgyE7vag=;
        b=NHzrPF2zWtjFs1sdJF/Xkn+PsuDwPW+d9YNKGnNRCbaOKZcfMUL+/Pqwf7L6zGeLI/
         U0+FgU/A2GzTUpc7VEgRulTJ8TMH1epSSR52tXCqgxaX/oQGiXpGbF4g48FEyumFLefR
         3VnkkWQgfqqbQeaVUF32N0x9E4uQaLvaaeA8b2/er1yl7yljneZMvjgSgklWRLmlWm19
         L+eQNH2OUvmZH5DfZnCiwBWCM1cUc9fL+o2IT2sRToEEz7Akz5Cy/0zxxNZAgKKTrqip
         KkWJ8lqwNCBZBRtcd4Tyn/5s//21QXfZ0CnfPvkffBDml2F+eAechouUps4lghEavd72
         E7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776329957; x=1776934757;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rHLTvTB9rDNh9jJv6Ebk36+huSVLvHgRUe2zgyE7vag=;
        b=FG6M9gq7YTp6NnOE3bmAXvTTCKEyNUM2OmVNdA3kgtwosbyk+zI89tiqGr+8ZsHWvW
         CLnA3f8O7Muw2QaZ+EaDkBou95kpOtd/AcoYRG3OB28yq+tbfzB2TPsEmHaEuv21J39t
         2VWKz87LETFFmqi0zlEfxvkFPM9gsXuNkp/55IXbfDPeohSQrxgCHj3Aq/h9yx9s7jqQ
         OS9ZTBDTGLUVSpjsaHN+xuT1OI+os0720RqiLGoDI0NQWL1FaN9TOp44xe0sPhXiqc9E
         2LFsUXl0yFvRKXaGCbtv31cAzZwTKM0MSxw0FZq2jQPzc/qHb786K1g7pWs9LaXMfNoM
         +VEA==
X-Forwarded-Encrypted: i=1; AFNElJ/cXXAkm5khOFrBqPX0nbLl3yKTIBl6Ri2Ygu5Vk9hzlauWQCwJccsEsZFjQI8ZUjtyDpQggH2mT7XrBOQawUIE@lists.infradead.org
X-Gm-Message-State: AOJu0YzvBXTq+MJnTqoxZRBKJG7hT6yhV6UfjbCI8Aa1BnBwBuYTrldc
	7SsQJAnGU3aEI0LnV+wMcYP87rCuFuXE2yzfucET7ss6jdBsP1U64bjSOFJqaur9paORetYtG9Y
	w7VlkZCKNyDMspqCGlKQ9223697eR/vZMYTF4W2ax1fVG
X-Gm-Gg: AeBDiethN3/iuoWlSp6SREQdBp6Nat0etlocW7GvXHB1d0j8cYj3KVV78AQ9FduJGDj
	nFJ5pycmL2lXwxfJ1edmPPVW9Gl5p9w8smqLO9ZlO5ILvkMNtkaH6iq0YOC8i5/+OYv/ucjbgGa
	72DVq4AXWGimibgONz3sQ7KRK5wYHVqQHZ0Angx2oJRXTpOVUixbfO90uq+4Enwwbs2gpW5yNKQ
	ZayW00qZbCjUxFTL9jKQDXciwy516SqUVbRTMYAJJ8hY1tulNt5CWPTI3wnjqAScfaOCfD68uff
	f61ezDlv2sFjLKN1d4mI
X-Received: by 2002:a53:c903:0:b0:64e:a335:95cd with SMTP id
 956f58d0204a3-65198b427f8mr17307099d50.41.1776329956736; Thu, 16 Apr 2026
 01:59:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260415174159.3625777-1-lgs201920130244@gmail.com>
 <ad_WmuauLJ3xDKqh@J2N7QTR9R3> <2026041603-guts-crested-ef76@gregkh> <aeCOdWLaVpH-5w8s@hovoldconsulting.com>
In-Reply-To: <aeCOdWLaVpH-5w8s@hovoldconsulting.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Thu, 16 Apr 2026 16:59:01 +0800
X-Gm-Features: AQROBzBJInu6_sedDTufJcGH_sz0MWfYgc8C0FVsACksumcnkFd7jCyotGqllqk
Message-ID: <CANUHTR9+Z9s3thfKMC5qiLMdYJAo-1sX1g9QiU65OVCbb+mAMQ@mail.gmail.com>
Subject: Re: [PATCH] arm_pmu: acpi: fix reference leak on failed device registration
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, 
	Will Deacon <will@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_015918_154559_66264A07 
X-CRM114-Status: GOOD (  49.30  )
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

Hi Greg, Mark, Johan,

Thanks for the further comments.

On Thu, 16 Apr 2026 at 15:23, Johan Hovold <johan@kernel.org> wrote:
>
> On Thu, Apr 16, 2026 at 06:40:55AM +0200, Greg Kroah-Hartman wrote:
> > On Wed, Apr 15, 2026 at 07:19:06PM +0100, Mark Rutland wrote:
>
> > > AFAICT you're saying that the reference was taken *within*
> > > platform_device_register(), and then platform_device_register() itself
> > > has failed. I think it's surprising that platform_device_register()
> > > doesn't clean that up itself in the case of an error.
> > >
> > > There are *tonnes* of calls to platform_device_register() throughout the
> > > kernel that don't even bother to check the return value, and many that
> > > just pass the return onto a caller that can't possibly know to call
> > > platform_device_put().
> > >
> > > Code in the same file as platform_device_register() expects it to clean up
> > > after itself, e.g.
> > >
> > > | int platform_add_devices(struct platform_device **devs, int num)
> > > | {
> > > |         int i, ret = 0;
> > > |
> > > |         for (i = 0; i < num; i++) {
> > > |                 ret = platform_device_register(devs[i]);
> > > |                 if (ret) {
> > > |                         while (--i >= 0)
> > > |                                 platform_device_unregister(devs[i]);
> > > |                         break;
> > > |                 }
> > > |         }
> > > |
> > > |         return ret;
> > > | }
> > >
> > > That's been there since the initial git commit, and back then,
> > > platform_device_register() didn't mention that callers needed to perform
> > > any cleanup.
> > >
> > > I see a comment was added to platform_device_register() in commit:
> > >
> > >   67e532a42cf4 ("driver core: platform: document registration-failure requirement")
> > >
> > > ... and that copied the commend added for device_register() in commit:
> > >
> > >   5739411acbaa ("Driver core: Clarify device cleanup.")
> > >
> > > ... but the potential brokenness is so widespread, and the behaviour is
> > > so surprising, that I'd argue the real but is that device_register()
> > > doesn't clean up in case of error. I don't think it's worth changing
> > > this single instance given the prevalance and churn fixing all of that
> > > would involve.
> > >
> > > I think it would be far better to fix the core driver API such that when
> > > those functions return an error, they've already cleaned up for
> > > themselves.
> > >
> > > Greg, am I missing some functional reason why we can't rework
> > > device_register() and friends to handle cleanup themselves? I appreciate
> > > that'll involve churn for some callers, but AFAICT the majority of
> > > callers don't have the required cleanup.
> >
> > Yes, we should fix the platform core code here, this should not be
> > required to do everywhere as obviously we all got it wrong.
>
> It's not just the platform code as this directly reflects the behaviour
> of device_register() as Mark pointed out.
>
> It is indeed an unfortunate quirk of the driver model, but one can argue
> that having a registration function that frees its argument on errors
> would be even worse. And even more so when many (or most) users get this
> right.
>
> So if we want to change this, I think we would need to deprecate
> device_register() in favour of explicit device_initialize() and
> device_add().
>
> That said, most users of platform_device_register() appear to operate
> on static platform devices which don't even have a release function and
> would trigger a WARN() if we ever drop the reference (which is arguably
> worse than leaking a tiny bit of memory).
>
> So leaving things as-is is also an option.
>
> Johan

I did some more investigation, and it looks like directly changing the
semantics of the existing API would break code that is already correct
today.

In particular, there seem to be at least two different kinds of callers:

Callers that already handle the failure path explicitly after
platform_device_register() fails. For these users, changing
platform_device_register() itself to drop the reference internally
would lead to double put / use-after-free issues.

Callers that operate on static struct platform_device objects. Many of
these do not have a release callback, so blindly dropping the
reference on failure would trigger a WARN.

Because of this, changing platform_device_register() itself to always
clean up on failure does not look safe.

One possible direction may be to leave platform_device_register()
unchanged, and instead add new helper APIs for the different cases.

For case (1), I was thinking of a helper like:

platform_device_register_and_put()

The implementation would simply call platform_device_register(), and if
that fails, call platform_device_put(). Callers converted to this helper
would then no longer perform their own put on the failure path.

For case (2), I was thinking of a helper like:

platform_device_register_static()

The implementation would first install a no-op release callback when
pdev->dev.release is not set, and then call
platform_device_register_and_put(). This would make the failure path
well-defined for static platform_device users, avoiding the reference
leak without triggering a WARN.

If this direction sounds reasonable, I would be happy to work on it and
send a patch, and I would also be very willing to help with the related
API conversion work for existing callers.

Thanks,
Guangshuo

