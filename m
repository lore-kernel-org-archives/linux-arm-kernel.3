Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8638E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 12:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8H1kLpsEkPiWWDJb8eSdKBuUSJU8siXOVQvVNi/wbZk=; b=DfNSFe+jhXYAgeUC2W7c56Nc5A
	CoPCgVriHSErlhERgamRUChR7rtyCmZQh3bkTFtlD/r4cunPQsnTm+pCNT/on7K1wxQks/rvmStaA
	3mEicNIffmTX9RhSCuQEiP4X+md4WD+hM92ipMNGVUqpBE4+rE7zSsPbp3gnanpb7Kyw3C2BPZFrC
	RHYB8wC7LJMP+qTmpBbYHJJ4gNn9tbRIU6oRVDRuNqSloRbB//Xz4D+QP00yLOkff29VuYvZmLc3g
	8iFMrDxhF93jNsi9q0/7mIjRlKkNiZzdh2UpO6JSm7uaO8KA3ZdRhLT+0jh7GTmYl3VCaCSiR7n1O
	Aa/bQ0Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLhvl-00000000JkJ-3n40;
	Thu, 12 Dec 2024 12:04:33 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLhug-00000000JXh-3Ofq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 12:03:27 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-725f4025e25so410503b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 04:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734005005; x=1734609805; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8H1kLpsEkPiWWDJb8eSdKBuUSJU8siXOVQvVNi/wbZk=;
        b=Zzr2ZK5F5NuUTERbL3e1vgXktK3fUZuPQV6Tmc+wDuIeU4ZoqKobfar8hb5Xd59g7l
         r0l4onPEkSkXz+ivRDM3y4cMOUxEYcgdWqXDc/RAwS1g7rgMIW9EPjTj5LhWZxeCrVn5
         ZgBlMpxoHE8eMixQf2jNhTx2e0pl9cLW1uMg9sYyTT4swViIl7Dl7WsqMgAxoKZ7i2Le
         d7r3y53YaiEnpGl3GMZN3KJqMvALajf4xU1+XwKpFFbzB6bvA4P15jRitMdWrMww5vxy
         0bZtnUR07q6nt3UTFzghXzEI40mu7duVhSq98/FFac4GCwwsEzjJ9lGZMqlUXuHlsg1u
         NSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734005005; x=1734609805;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8H1kLpsEkPiWWDJb8eSdKBuUSJU8siXOVQvVNi/wbZk=;
        b=LvO2DRMnSjCo1v2U8T1+V/3Vtz1I0X/6h04iYCN9x0GsMP8MprudGTyhLuWSfCtNQt
         2dmMMOz+JFSJtlk/AMGdzFKPtNaK36zDrXgauIS2T5yjvNjFILAJ1IX6wIf5j/8EEMcz
         5MHmFsvz8Ex7evd2+INqy6ttn8fifEtbik1VBrQE+KobW/3a02uv6q0xlpdaIfo6tvtj
         8e+oQfEELqCF2WC2fqvIJ99T9HfcvxTz90dcHM5YkmVOEdjn989b3vnlbKlNvJWkgnNs
         6NTCcwl9O6//axUckgQCUtHYfHDCXIfBRIIeKuhdlBoErDksGhRtOInbTf/6aS/YNUgl
         j7xQ==
X-Forwarded-Encrypted: i=1; AJvYcCXC8mPKACNbi/oLYh3V6DaN4v7JhiyhK2XMU4ut9PifjCevUEs3e6w8pf2Uw13P3AUpnfPH3vyimfYkJ3IToAUX@lists.infradead.org
X-Gm-Message-State: AOJu0YxBRajdLXlzjra2qkYe7p0p/i15V5G+4piHSIVwTCiufrRuwcWJ
	TNSXS+muwQ58VNHHOjvbyUiBwSfgOcu4dPwFmX3F418dqMP4ZEnQlBTBUj18xY2gZw3jgueHIOi
	utJ+C9o/UG6MArxGlrYPBCGhSxTRftfW5esqlwQ==
X-Gm-Gg: ASbGncvy4bMWVFRuzw4arqXkCfQGDw1BojpRdB/fuMaD3UCHiWefIRMOgbNn7mpEe1l
	Zfa0XzN0YhsWlj92dQw3p8QhZ7EtUQ2/E6dK87ZE=
X-Google-Smtp-Source: AGHT+IE+Kg8u9Lbn6QLKaDT/b3zDFNcKPhMdlgmxpI6xjlm9dAXphccBXriO7tXjnrHdrxfQu2FMYv1+/OPRV9wJcBA=
X-Received: by 2002:a05:6a21:78a4:b0:1e0:ce11:b0ce with SMTP id
 adf61e73a8af0-1e1cebde749mr4535655637.35.1734005005188; Thu, 12 Dec 2024
 04:03:25 -0800 (PST)
MIME-Version: 1.0
References: <20241127134256.2254851-1-mike.leach@linaro.org>
 <20241127134256.2254851-9-mike.leach@linaro.org> <9cb1ef5e-eb61-4177-a039-4049850196a5@linaro.org>
In-Reply-To: <9cb1ef5e-eb61-4177-a039-4049850196a5@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 12 Dec 2024 12:03:13 +0000
Message-ID: <CAJ9a7VhG0Mxo=66JpGkPYDBLwo_fmv6BbLx2jPLeDd76f2gfCQ@mail.gmail.com>
Subject: Re: [PATCH v7 8/9] coresight: tools: Add configuration table test tools
To: James Clark <james.clark@linaro.org>
Cc: coresight@lists.linaro.org, Suzuki K Poulose <Suzuki.Poulose@arm.com>, 
	Leo Yan <leo.yan@arm.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_040326_862499_8019C30C 
X-CRM114-Status: GOOD (  51.87  )
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

Hi James

On Tue, 3 Dec 2024 at 14:25, James Clark <james.clark@linaro.org> wrote:
>
>
>
> On 27/11/2024 1:42 pm, Mike Leach wrote:
> > Add an example config table generator to test loading configuration
> > tables.
> >
> > Provides a table buffer writer function that can be re-used in other
> > userspace programs.
> >
> > Table write format matches that expected by the corresponding reader
> > in the configfs driver code.
> >
> > Generates tables and outputs in form of binary files.
> >
> > Add a config table file reader and printer. Takes in config table files
> > and prints the contents. Uses table reader source from kernel driver.
> >
> > Signed-off-by: Mike Leach <mike.leach@linaro.org>
> > ---
> >   MAINTAINERS                                   |   1 +
> >   .../coresight/coresight-config-table.h        |   5 +
>
> Hi Mike,
>
> Isn't there some convention about maintaining a copy of kernel headers
> in the tools? Especially as you wouldn't rebuild the tools after
> updating the kernel headers so breakages might go unnoticed.
>

Not sure - perf keeps a copy and has a check script on build to ensure
the copy matches the kernel version.
Keeping two copies of the same thing always strikes me as poor
practice, so I went for copying over.

Both methods risk breakages when something in the kernel changes.

> [...]
>
> > +
> > +/*
> > + * sets of presets leaves strobing window constant while varying period to allow
> > + * experimentation with mark / space ratios for various workloads
> > + */
> > +static u64 afdo_set_a_presets[AFDO_NR_PRESETS][AFDO_NR_PARAM_SUM] = {
> > +     { 2000, 100 },
> > +     { 2000, 1000 },
> > +     { 2000, 5000 },
> > +     { 2000, 10000 },
> > +     { 4000, 100 },
>
> The comment above here looks like its for example1, this one does vary
> the window size.
>
> Probably only example2 is enough, I assumed they were different but
> example2 is basically the same as example1 with an extra preset list. We
> could comment that the second preset list is optional and delete
> example1. Saves people reading more and wondering what the difference is.
>

Yes - perhaps both examples were not necessary - but the point was you
can have two configs in a single loadable table.

> I tried to make an example that doesn't use an existing feature by
> reacreating afdo from scratch which I thought would be a good example.
> It's pasted at the end. I had to copy paste the ETMv4 macros and
> constants though, I couldn't include them in the userspace generator
> because of this error:
>

The updated ETM config set that is to follow addresses this issue -
the macros are split off into a separate file  (and adds in a whole
lot of validation - ensuring a configuration cannot specify and
allocate more resources than are available.)
This is also the reason that the examples provided were very simple.
More complex ones are to follow!

This set was focused on loading tables so that the next patchsets
dealing with resource validating ETM configs and CTI configs had an
easy to use test platform.


>    coresight-config.h:10:10: fatal error: linux/coresight.h: No such
> file
>    or directory
>     10 | #include <linux/coresight.h>
>
> I also got this error when loading it:
>
> Unable to handle kernel NULL pointer dereference at virtual address
> 0000000000000008
>
> cscfg_reset_feat (drivers/hwtracing/coresight/coresight-config.c:64
> coresight-config.c:124) coresight
> cscfg_load_config_sets
> (drivers/hwtracing/coresight/coresight-syscfg.c:217
> coresight-syscfg.c:262 coresight-syscfg.c:492 coresight-syscfg.c:610)
> coresight
> cscfg_dyn_load_cfg_table
> (drivers/hwtracing/coresight/coresight-syscfg-configfs.c:294) coresight
> cscfg_cfg_load_table_write
> (drivers/hwtracing/coresight/coresight-syscfg-configfs.c:799) coresight
> configfs_release_bin_file (fs/configfs/file.c:415)
> __fput (fs/file_table.c:432)
> __fput_sync (fs/file_table.c:517)
> __arm64_sys_close (fs/open.c:1568 fs/open.c:1550 fs/open.c:1550)
> invoke_syscall (arch/arm64/kernel/syscall.c:?
> arch/arm64/kernel/syscall.c:49)
> el0_svc_common (include/linux/thread_info.h:127
> arch/arm64/kernel/syscall.c:140)
> do_el0_svc (arch/arm64/kernel/syscall.c:152)
>

I'll go back to my tests to check I was testing what I thought I was -
and didn't accidentally change something after testing and before
sending the patchset.

>
> So I'm wondering if we can do the same thing by setting values via
> individual files rather than one binary blob which would avoid some of
> these issues. From what I understand the feature params can already be
> set directly this way via
> /sys/kernel/config/cs-syscfg/features/strobing/params/period/value
>


> We'd have to add a way to add new configs with a mkdir, then the same
> things can be configured without needing an additional tool. Links
> between features and configs can be done with symlinks which is also
> mentioned in the configfs docs.
>
> Something like this would be a bit like the current version:
>
>   # ls /config/cs-syscfg
>   configurations
>   features
>
>   # mkdir /config/cs-syscfg/features/my_config
>   # ls /config/cs-syscfg/features/my_config
>   description
>   matches
>   regs_desc
>   params
>
>   # mkdir /config/cs-syscfg/features/my_config/regs_desc/TRCRSCTLRn0
>   # ls /config/cs-syscfg/features/my_config/TRCRSCTLRn0
>   type
>   offset
>   val
>   mask
>

This is precisely what I wanted to avoid. Doing it this way is both
time consuming for the user and ends up reproducing most of the sysfs
files in configfs.

Parameters are there to allow a limited amount of relevent runtime
adjustment. Parameter values may also only populate part of a hw
register depending on use case.

The resource approach allows us to define certain bitfields e.g.
Branch broadcast - as user configurable - but omit anything users are
not allowed to meddle with.

The table load is atomic - it is validated and succeeds or fails
completely. The load mechanism prevents the new configuration from
becoming visible until it is loaded. The configfs per file method has
an issue in deciding when the configuration is "complete". If you look
in the configfs docs/source there was at one time  a  "commit"
methodology proposed, but this never came to fruition.

Table load  re-uses the same mechanisms as the built-in and loadable
module methods for adding configurations, but without the need for
re-compiling the kernel / compiling against a specific kernel -
meaning loadable tables are dependent only on the hardware available,
not the kernel version. Adding a per file option means that the new
configurations would be different from the current load methods
upstream - and appear differently in configfs.

> But another way could be to enumerate all possible regs for each device.
> This would remove the need to have all the #defines in whatever tool is
> making the config (avoiding the #include issue from above):
>
>   # mkdir /config/cs-syscfg/features/my_config
>   # ls /config/cs-syscfg/features/my_config/regs_desc
>
>   regs_desc is initially empty, but specify what device it's for to make
>   all the properties appear (or the mkdir could be done in an etmv4
>   folder):
>
>   # echo "SRC_ETM4" > matches
>   # ls /config/cs-syscfg/features/my_config/regs_desc
>   TRCRSCTLRn0
>   TRCRSCTLRn1
>   TRCRSCTLRn2
>   ... etc ...
>
>   Now type and offset don't need to be set:
>
>   # ls /config/cs-syscfg/features/my_config/regs_desc/TRCRSCTLRn0
>   val
>   mask
>   save
>
> Don't we already have the full list of parameters in
> etm4_cfg_map_reg_offset(), so we can expose this to users via configfs
> directly rather than needing any tooling. And doesn't any new device
> that's supported by the config mechanism need to know about all its
> parameters, so it wouldn't remove any flexibility?
>

Mike


>



--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

