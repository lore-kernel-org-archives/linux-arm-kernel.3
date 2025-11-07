Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8C1CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 16:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dg933HfjmwHj361hda6LQqGZtOS/62lJRP7depBzGUE=; b=n9oFMirE+D50fZZBfFtp03b/bs
	lluqHHIxHY/TRQxa22NjVMQfnVeW/1w2KSErpUNAaJ44wjrIsB4ABfvp8XXKJmIcBI/FlXUsDa4s7
	8XmQz/EA6xSHm2tx+N6ixJiZSRkbqwj2Kw6Ok+YJNzKlKFBb4WuXBD46VP6sEu6SVS2EtFBQXC/1v
	9QHFXAEDsUUXVtl52dxtfy5vHBnQSu0W+cbyEAmRCW6VpZf6aSZfZo9urg9wVFekN0bBPubjB+mlh
	E3zwDZJ3nDTLMA/KrqKK1mg8toXQ4DCyDPnZMy+vKv8KMGgzo3fTWTAMvHA3A4aTC7LShl0yr1xgz
	/YK0YlgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHPGO-000000005Wd-05Bc;
	Fri, 07 Nov 2025 16:24:36 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHPGL-000000005WG-1IUX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 16:24:34 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-8b220ddc189so120901385a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 08:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762532672; x=1763137472; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Dg933HfjmwHj361hda6LQqGZtOS/62lJRP7depBzGUE=;
        b=ik4cm9yoXB0oZ4GzF54Mv6bE8VsHh35ERRLlpHzbpQOaSKZrnvzhRFBk6Jr4hvTbxH
         qAtku93FcRkTrkbtOkODKsyCiqUzS4+cjvseLCKhZLrdsr98CBrqZOyd+RD4v28nLUhE
         W/KhRuv2mDeoCNi3uRelsGYclhXizynfC2U4aqHkSVv/pZHmI1euP5hN9OYx/rTDWY2R
         Boz/snX+ZnCjwLFwAib7tdZvRPAU5lVP/hkAK7/pPmYol1u+Yv+78JsX9/R75tPQeD2t
         yNg6LClFqMJQNxV6b+3ihuPTmriKueYdLejgkvSisTWjAXj6sfyNiba4iTA3jlmAU8sN
         iAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762532672; x=1763137472;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dg933HfjmwHj361hda6LQqGZtOS/62lJRP7depBzGUE=;
        b=kP/qqgcsDLDTp5A2e4CmUx49UOCBDfgrzn8M19lAzVmhth4VEUms8Vyyv+nSahb03c
         mLkouWZqtC4a2jm2hSY1d6SjAjd1YrtdeNOSqbar7GdokVf0Bxu0ko+itqyiG3KFeAwc
         9d3rtCUiPVb+hB4LJOcQjOCM54517maxFA/AJGXFHSJ7NigE240GBtbSw4WG8711Mz73
         CCbA+2d3pey3w1Ew0hrFD+av3gFcrgwf4Wqw5vLn0FJdMEYHgcLSnjBTc4xFXs181z7k
         E0JxEK6ET++U45QERUa7J0lqKF7B5IWTjPHNvCPf1aE7U6OC8+XRTf7jr7leiifHpICq
         j4BA==
X-Forwarded-Encrypted: i=1; AJvYcCVVGksBZOAypl4lnYIRmwJC0viIKnxBTHoJhD4jOFhg4uZqHI02o978/dQ8s7VX98+HCzl5ipr33E5JD/d0Q3QY@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4F3ZFgZjTcwVBlGlkio2YCa6gymnG6YXmG2zDrECUh9e4kRdv
	qH6Kf8tAPtzgmdTvgRyM3cDTILc12n0zd0Nej26mPArm/zrcLV4ew0hJ1/5hOjR1AGEtUv3DmOp
	7+1J8qVj/sQyKawWyVy11vV6Cj1KbpnvQRVhOKYJINg==
X-Gm-Gg: ASbGncukd4DrElYSfnfmgSBfIkF25jImwIF1WSH71gvpI7OjekCyeS2IbyZ6kTChqcM
	yXzrtPJ3Lw2KM/fz4n6ru+mrMugH9k/0b9elGpDyB1YCz376q8sUvJpSr+uq0yfnGKalQpSKCt8
	YVHztvAJHsd2lShtjLnsU7mQGw3sTkFDmnCViTbfUzNIDZuxxnrq3kGdchkhoPC8ZxSyKqT8tjM
	2q+ycysVtMp8irm26jdWfMalVtcawMchT4zSZqcAg3Q4sHH8CODKGahWfL8TAMmCpvSkGky5vqh
	qt+TutH9OGmON3QYXg==
X-Google-Smtp-Source: AGHT+IHCkiDrjY2sdtFhfnWtIG5/yIGmjgCTWa+pkSAhfbWzXXqFVFpKvKWb21AxAOgEsY/fAjUmNILp7tvkwx81+WA=
X-Received: by 2002:ac8:5d47:0:b0:4ec:ed61:997c with SMTP id
 d75a77b69052e-4ed94988581mr46526991cf.30.1762532671602; Fri, 07 Nov 2025
 08:24:31 -0800 (PST)
MIME-Version: 1.0
References: <20251021-fix_etr_issue-v3-1-99a2d066fee2@oss.qualcomm.com>
 <176235893222.387743.2128022832743502879.b4-ty@arm.com> <CAJ9a7Vji3fFnc-XPhdTxh00QW+AjqLqJo=zt+SMwovttQRwR8Q@mail.gmail.com>
 <2835dd93-c945-4c19-9d10-0271b14147b2@arm.com>
In-Reply-To: <2835dd93-c945-4c19-9d10-0271b14147b2@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 7 Nov 2025 16:24:19 +0000
X-Gm-Features: AWmQ_bnU-O7JUHwcgVFk_3qB9Yn3r0GZGnNdkrfA5bMc_HIfGoFxxRf1tq0dPXQ
Message-ID: <CAJ9a7VgXEQQmj6o7n-mPx0qtrCQXKmddGS6BugHb=xaxVAUTUQ@mail.gmail.com>
Subject: Re: [PATCH v3] coresight: ETR: Fix ETR buffer use-after-free issue
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Linu Cherian <lcherian@marvell.com>, 
	Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_082433_386859_74C1500B 
X-CRM114-Status: GOOD (  27.17  )
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

Hi Suzuki,

On Fri, 7 Nov 2025 at 13:28, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> Hi Mike
>
> On 06/11/2025 14:14, Mike Leach wrote:
> > Hi,
> >
> > Is this fixing the correct problem? If we prevent the buffer size from
> > being changed while the sink is active - which is probably what we
> > should do anyway as no real good can come from allowing this - then
> > the problem disappears.
>
> Good point. But this is completely fine for a running "sysfs" session,
> as the values are not updated (unlike perf, where the session is
> scheduled out and put back in ). So, I don't see why we can't change
> the values while the sink is active ?
>

Why would you want to? There is no reason i can think of, that a user
would need to alter parameters while the sink is running.

If this is a sysfs session and a user changes buffer sizes between
enable commands as per Leo's example sequence - the result is a silent
failure and confusion for the user as the captured buffer size is not
in fact what he just set.

Moreover, the sysfs files (not just the buffer size) write directly
into the internal drvdata structure, some of which are then used to
program the TMC registers  on enable - which is common code between
both sysfs and perf. Thus for perf you have a lovely race condition
and for sysfs you again end up with values that do not apply to the
session just run.

Seems more robust - not just for the sysfs buffer size. - to only
permit changes when halted.

I have sent a follow up patch which should make things clearer.

Regards

Mike


I've sent a follow up patch to address this - and the potential race
condition.
>
> >
> > Changing the buffer size while the sink is active should return -EBUSY;
> >
> > Mike
> >
> > On Wed, 5 Nov 2025 at 16:13, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
> >>
> >>
> >> On Tue, 21 Oct 2025 16:45:25 +0800, Xiaoqi Zhuang wrote:
> >>> When ETR is enabled as CS_MODE_SYSFS, if the buffer size is changed
> >>> and enabled again, currently sysfs_buf will point to the newly
> >>> allocated memory(buf_new) and free the old memory(buf_old). But the
> >>> etr_buf that is being used by the ETR remains pointed to buf_old, not
> >>> updated to buf_new. In this case, it will result in a memory
> >>> use-after-free issue.
> >>>
> >>> [...]
> >>
> >> Applied, thanks!
> >>
> >> [1/1] coresight: ETR: Fix ETR buffer use-after-free issue
> >>        https://git.kernel.org/coresight/c/35501ac3c7d4
> >>
> >> Best regards,
> >> --
> >> Suzuki K Poulose <suzuki.poulose@arm.com>
> >
> >
> >
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

