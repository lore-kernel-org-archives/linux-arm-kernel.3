Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B796E7C6F9
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Feb 2026 01:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:In-Reply-To:References:From:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YtJzQSsz3r19x6lp4EmF1fkbMg2fNMXsYEr5P8h6zJQ=; b=UJnI5PuhVLUD3xoCnOhMIAw9d4
	4kM0UeYESnVirbbkxvXyXysUF2+V6/ApT/YchnwKE/+CGz0fjnXdTrl+u63IvCwJVvp9SkpxYGH/L
	hQ1S2Ow7SOGH69B1pUqtCdl90/CPI4+ZRz8i9o9onr00/BhKqyzHdww84gU1FHEBc2NCC4vHgUSiX
	gWF/GkP6+DJzfy2tLIf056hiyipwXkLf24iSerK9CiStXpFH1UJqiyUI7TMRdQDrw5uJwSxM5dZqf
	AkJr5YbmImaY6GJ3D0j6qw5slMyKN1S9Bnjb68MSi7UBHN+T1EHMftgL3Oy4K4KfppV787FU5rGDo
	vPzpvl6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmMIY-00000003AE7-2Fyj;
	Sun, 01 Feb 2026 01:30:46 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmMIV-00000003ADm-2WrZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Feb 2026 01:30:45 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-794911acb04so30817137b3.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 17:30:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769909441; cv=none;
        d=google.com; s=arc-20240605;
        b=PvrauilSej6FoiTPlFsYHVT5ePtdpULo8Q4Ew2+VfdlwHUU9FLBUeHDmKCms+JAhHp
         AY562oggWM8CCjQvHhRG/fqxhNC5IlT3/DYPksuKGXFOOwFVZ2VUVKQhuk97luaNKBqk
         3YbJYDygEOWgYHMHQ9pfaclpddasB3hU39IHXfcbdXjSB6fzf3vor9DTk7fhf3ebTrv0
         +b3elLkP+9zHl53S20SgC7SJwqLuYhJRKj0idmY/WlWhYcLbwb1IBhjbJZ/ldGQvf56B
         i5yOx0FYOsZcDtFo4nX6adNotbWkTU4mAF6CqnYcqCgkIEV0ZgvsKLLy7zT7GZYb9pE9
         o37w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:from:mime-version:dkim-signature;
        bh=YtJzQSsz3r19x6lp4EmF1fkbMg2fNMXsYEr5P8h6zJQ=;
        fh=YiZ5X5BC8wLHHDps9m/uEacsYMiExbnYAWWDGlu61ug=;
        b=eynSJUzBAgO00nGL+kv5RwMol8jepNPLIgaBExIyIHIS4qPCYVEoA5PLkJsq23EZps
         xT9Zp//dXahYmCoonoig3PPE9HDzcKsTbvzusVCYs7PSMXxlht9FC+XccmKgYEG3k3QD
         2UTHeGPCxDa9DoJn7c9+ggLTV5aQr9VhTNL4PF56tSswlVraIogyGqfRQZRfrQYO0QPr
         I38pWXr5bT5+BrlKCddeqbYoyYh5v6UvXLu3SYH93MFeONZSFNJEqxrvmKzsnpWUanN0
         m9wppzzgvbkM8oJtGgwRP2y8Sin/j3Yt0iWTPICpttX3Zwq2L5ouDjrLfVv8EC0Jiirl
         w1Yw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1769909441; x=1770514241; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:from:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YtJzQSsz3r19x6lp4EmF1fkbMg2fNMXsYEr5P8h6zJQ=;
        b=VjbcT+CloUzF2P3QV1B0DWZLLdOLeW4+0e5UiPflW3nGwMI+J6bdx2Fe7wgWJKTHjk
         nOaeH3+Z3ZiPXNHLcg135e7Gg86sWyC1JrF0ViU/oIazY2H6/EUl5eqtznIz9u7ya5fg
         lBRrbkrByplyxZCE0J8S5wJ8ndwSfIeabs5JJumpXZ2tG3aGdFtZQG7F5aWOPwdhTCdo
         DEGiO/Tr3Um3gSX57dtIau/OyfJ8XY1A5Ev7HgrRrnDY1Md/NxUdSrlIbVpksrVoXl+e
         q66gOIu3gNCs7C7hiYNwtvKzSlAx/bK8t6av9C9G+Jt/+1sG6IY6F1M7BU93WmHNGT76
         ZPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769909441; x=1770514241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YtJzQSsz3r19x6lp4EmF1fkbMg2fNMXsYEr5P8h6zJQ=;
        b=D80Bpho/d/daDxIbUzE98LvLSaWzwO7XvjFx1zCJS2FN2ZC5AddjZsmrK+lqeLER6K
         LEQHzsF5WLwSmxsrnXi0ZgOAxonWSisxT2Pe41YH48oE3gtM2wHRzUOP4/rhP26DjRYa
         jkSBXHwrXHCckdjawBlurxa+lIHefwZrwp2paqz+wg3qQIIaFEcnHH8OPzXSjl/rNaSY
         9oydFUpngH44cTgKmvdoi1zVvx5IU9aRhu5xYEzgn8dsFyWO02vUe/rMtyUWmygoK/n7
         c5LuoTfJ9KWCo+4K3VeWFEhNQpwz0JUGJN5ffS+xMsn0o/wyfhyTD4avpBnFlHavUjKL
         s1tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXI6YkEnyQAm0iHjR5jdB4L6rOeIcdNVZwU7yRKMmesjvj933BEpgnb1C+p608qXD9XAtN0zECNMva4Z2xC09e8@lists.infradead.org
X-Gm-Message-State: AOJu0YziNXXR+KTwf9kWu6u+mS3vYYluCyoSVn0OGIz8fopztW4T+xDs
	Ksnzvp4+Pm8hso96klNZJj5XeOO9UETh6CIiL83wY445OjRiBc1THHe6oUq9cO1ldN6p50a8zf5
	Zlr2mnCo3vt/GKhTLAiCmRgB4G4CrzKTbUW/tG36joyoLUi7gTNKm
X-Gm-Gg: AZuq6aIrXX8a1WCI6SdfCWH9CQxFI0CF1OUaj3NZYOf3U0kJhxJ+9VjWfO0rVWtuS4g
	qzASbEZYS3pQZm6ycAJ26p5j3qsLuKYwsUl+YJLUOVE4a5OOeoZ31rmQAntedkeKyioGA6pYF9h
	Xw1VKXVr97IC70/5PSLlrS8r8+wX9jgkO7bBTjQOCMmDzfT9jw3PWakFZ0DorP6gRRdpp2jlnzk
	74S7h7Ls951ghD0HPy9nANSQkFQxCHhVnrEG9qcMBf9OAMVKgVVZkriuHkCed3F183biBuv
X-Received: by 2002:a05:690c:10:b0:786:25e9:387c with SMTP id
 00721157ae682-7949dea8009mr71339287b3.20.1769909441554; Sat, 31 Jan 2026
 17:30:41 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 31 Jan 2026 20:30:40 -0500
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 31 Jan 2026 20:30:40 -0500
Mime-Version: 1.0
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: aerc 0.21.0
References: <20260129-i2c-xiic-v7-0-727e434897ef@nexthop.ai>
 <20260129-i2c-xiic-v7-1-727e434897ef@nexthop.ai> <ab9dc191-59c1-40a9-bbf1-e6c082af128a@lunn.ch>
 <2428D892-89F9-4013-9681-AD9BD76B0874@nexthop.ai> <aX3VqGlIUGCvMY5p@smile.fi.intel.com>
In-Reply-To: <aX3VqGlIUGCvMY5p@smile.fi.intel.com>
Date: Sat, 31 Jan 2026 20:30:40 -0500
X-Gm-Features: AZwV_QgjzkwTZse_VBoXXZ0HhPaLJE15hdM8B0uOOS1PwkXcf_ENvfshKOTUuzk
Message-ID: <CAGYn4vxRbPVFvzm1b_mk2KvnRcJSO0Ewmx1tCTEALaZAu+ZQJQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/6] i2c: xiic: skip input clock setup on non-OF systems
To: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Andrew Lunn <andrew@lunn.ch>, Michal Simek <michal.simek@amd.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_173043_665641_5BA6E581 
X-CRM114-Status: GOOD (  13.44  )
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

On Sat Jan 31, 2026 at 10:12 AM UTC, Andy Shevchenko wrote:
> On Thu, Jan 29, 2026 at 03:29:45PM -0800, Abdurrahman Hussain wrote:
>> > On Jan 29, 2026, at 2:43=E2=80=AFPM, Andrew Lunn <andrew@lunn.ch> wrot=
e:
>> > On Thu, Jan 29, 2026 at 09:43:13PM +0000, Abdurrahman Hussain via B4 R=
elay wrote:
>
>> >> The xiic driver supports operation without explicit clock configurati=
on
>> >> when clocks cannot be specified via firmware, such as on ACPI-based
>> >> systems.
>> >
>> > Are you saying it is technically impossible to specify a clock in
>> > ACPI?
>> >
>> > Maybe a more accurate would be:
>> >
>> > The xiic driver supports operation without explicit clock
>> > configuration when the clocks are not specified via firmware, such as
>> > when the ACPI tables are missing the description of the clocks.
>>
>> Actually, ACPI (since 6.5) added a ClockInput() macro that can be added =
to
>> _CRS of a device node. The ACPI subsystem in kernel could parse these an=
d
>> convert into proper clocks integrated with the CCF. But, AFAIK, this ide=
a was
>> rejected in the past.
>
> Rejected by which side? CCF?
> Because specification still has that.

I think the argument was that on ACPI based systems clocks are "owned"
by AML and there could be syncronizations issuebetween AML and the OS.

See https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1712165.ht=
ml

