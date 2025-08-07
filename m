Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DCAC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 18:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=T6su/4EhSTEeQ3RIzrMdpMTQS3Ts3FgqkCaCvrRsQR0=; b=0v4aTiBylubJny10KGLBWGRXUn
	K1ETLDi3F/1KjeSJZI2lTYZAbobnR/EMasEnk9T2plx8zqufY91WgtVeL2oPmYp3w42xYTwytl10v
	/vL5G57cUdRgv8PDPbYafSY3rQMUr49+sC8d462rGaWl7P2DjRfQuoCPSsGbyUWrVLeJtKVp7zM3I
	JZknvXaDuiwbnk2zdyEPlsQRu02L4ulROknHuCH0YGEO166faLTI2szXfb6RkixTSLz3SPtB6VEp2
	ieaNw0+1f6+0tUEBnUEPNPxloVOibe3juozUwTzJsv3595aiyUa9gHSL1y67/ZZ52VEkI39/euJeV
	iape1HXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk5At-00000001Jn5-3WON;
	Thu, 07 Aug 2025 18:17:11 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk58M-00000001JcC-1HOU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 18:14:35 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-76bc55f6612so1359969b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Aug 2025 11:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1754590473; x=1755195273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T6su/4EhSTEeQ3RIzrMdpMTQS3Ts3FgqkCaCvrRsQR0=;
        b=QBVUAG2DMpnOhvyhtzVKsW6eRNytTIc8OqlOBMaOTQnDLRlmvuYMor2cMHs4XfGn3d
         Vh5Vxh6RpsBiVO+I+FW0DCx/mz/f8L0IjcaYLBaYT7jJuGjkjNYs6oY1piNXfFUUR4Mx
         A5teIsS7ec8OPYxKs/mEg8PpvWzgiJNG5WT0PLl9DjtAknE8iCMwquEjZq1UB7TwAQqx
         /RBWCgvU/MqHBdr2Jb98N/yq5tNCYrvc6uAz9dmvkTxvciAe9BFWFgnVi7u70kDOEiY7
         eNOJo85Cu5Y+Q8iu+27SeoL0hwbi5/LMY9ywrlEYUkvq+HIiLqyn0FmA5f7UkSWM/Nsq
         3kFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754590473; x=1755195273;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6su/4EhSTEeQ3RIzrMdpMTQS3Ts3FgqkCaCvrRsQR0=;
        b=KAPooDrssKBYHXMxp6bLGdTn1Tg207oJxo+C5EiZ28LglRb25rxqj9XrK5LkQNBYZ1
         fklM++0TfLDm8vp0qxRDHTPFgaQKQaXeKWmsNkHsG1SNn+N9d/C8thbYSG1iRZygyasz
         lOm/5d9CJCm3e1+OWaoQhrwbT83jWV9oob72wyM0HdXgo0E6KbnFxrPvXGEGy+eIUDi9
         HJ/rOs9IY8RO++ZORle1jyGuxX3guqvJgbk8MASVxkFMskCw4cmR8hNpdJtA69CoGK7f
         FPjFX+C1e19SeL5QX65e8oa5EKgPC1Smi+Jac2P4AUWgMIf7Yg2pxVMYWlRF4UVUSBMr
         VZ/g==
X-Forwarded-Encrypted: i=1; AJvYcCVPQbXUtZufhqHyNE2NPj/CRlVH9a8/u/UdEgz4uqTiwR4g40+rz/1A5RJ7xwmt2LploIMNMqUZKh0w4ADQwRX4@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2Nc03LnV0kXV/dRHLIkdzy1AS//KEfv2p/DXUis4ax5GvI4Hm
	YltW7btsgsXuTKwAE3+UpGvDROLu/8kSuq0lJF1pdfLBe7+lwN8zBu+qZBreRCu3J9o=
X-Gm-Gg: ASbGncsC48e3zxgAlrw/2PhC+qfrS/BetVbXYUDGq++ybumow7686lbmilrt8ngY1ho
	aDaF9N4vZFaKpsnk80KqfNWJxjsmvj8F4Uy49/I5nsl4hgNfYtiwZXUFA3L6dCq+Y7joLQUdp4A
	uk45AZDO2bi6fGgsRoY00AzNoFg6NXPQ7fSyCwYR/oFc1oNnW7Hhwz2Bb56PFORWlY1cH2KlT79
	9sX8dZU5K+AoakyoRst+onZ1vIsyGQUON6BO6sanBFebAZhRMS0/IWKhdDger4uDWwAaJ2Jow9C
	h1QPcNv4MnBWYWU66DO3B2OXmLdGr9YgQwcyC6KolDlEFCL88+gMNto4uGYWFYWWxCWVlDwd01k
	CDiFXJi8iQiTKxRR1bEnw
X-Google-Smtp-Source: AGHT+IHP9EUAhOlvp96atr/vbagfiqpAP24IOcQXyVOv0EdKmDG/UBY89Ef20JFJNMEpZBqO9V2fEQ==
X-Received: by 2002:a05:6a21:a247:b0:23d:6475:40aa with SMTP id adf61e73a8af0-2404102b499mr7439564637.0.1754590473365;
        Thu, 07 Aug 2025 11:14:33 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:30b7])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-76c3f85c720sm1263514b3a.27.2025.08.07.11.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 11:14:32 -0700 (PDT)
Date: Thu, 07 Aug 2025 11:14:32 -0700 (PDT)
X-Google-Original-Date: Thu, 07 Aug 2025 11:14:30 PDT (-0700)
Subject: Re: [PATCH] arm64: Expose CPUECTLR{,2}_EL1 via sysfs
In-Reply-To: <92feb0bc-18b9-438a-9567-a9059a8cb9dd@sirena.org.uk>
CC: Marc Zyngier <maz@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
  Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, oliver.upton@linux.dev, james.morse@arm.com,
  cohuck@redhat.com, anshuman.khandual@arm.com, palmerdabbelt@meta.com, lpieralisi@kernel.org,
  kevin.brodsky@arm.com, scott@os.amperecomputing.com, james.clark@linaro.org, yeoreum.yun@arm.com,
  joey.gouly@arm.com, huangxiaojia2@huawei.com, yebin10@huawei.com,
  linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: broonie@kernel.org
Message-ID: <mhng-48855B75-93F8-4CE3-B50C-26D49C2F9223@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_111434_348536_3CDD172B 
X-CRM114-Status: GOOD (  29.51  )
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

On Thu, 07 Aug 2025 10:57:26 PDT (-0700), broonie@kernel.org wrote:
> On Thu, Aug 07, 2025 at 10:26:29AM -0700, Palmer Dabbelt wrote:
>> On Thu, 07 Aug 2025 01:08:26 PDT (-0700), Marc Zyngier wrote:
>
>> > For a start, these encodings fall into the IMPDEF range. They won't
>> > exist on non-ARM implementations.
>
>> OK, and that's because it says "Provides additional IMPLEMENTATION DEFINED
>> configuration and control options for the processor." at the start of the
>> manual page?  Sorry, I'm kind of new to trying to read the Arm specs -- I
>> thought just the meaning of the values was changing, but I probably just
>> didn't read enough specs.
>
> Yes, pretty much and also because this is in a range of registers
> reserved for use by the specific implementation.  See DDI0487 (the ARM)
> version L.a sections D23.3.2 and D24.2.162 which specify the
> IMPLEMENTATION DEFINED system register range, and the definition of the
> term IMPLEMENTATION DEFINED in the glossary of DDI0487.  If you see a
> small upper case term like that in a spec related to the architecture
> then it'll have a specific architectural defintion.

Thanks!

>> That said, part of the reason I just sent this as-is is because I was sort
>> of expecting the answer to be "no" here.  No big deal if that's the case, we
>> can figure out some other way to solve the problem.  Happy to throw some
>> time in to making some more generic flavor of this, though...
>
> It's something that does come up, working out a way to make use of the
> tuning in the IMPDEF registers in a way that generic software can safely
> and sensibly make use of is rather non-trivial though.

Ya, I'd expect it to be a bit of a time sink -- even if something like 
this patch had gone in we would have had a pile of ugliness in 
userspace.  I think there's no way around some amount of ugliness when 
it comes to implemnetation-specific, though.

That said, if our nubers do pan out here then we'll likely need to do 
something.  So if a more generic solution is interesting to people then 
I'm happy to throw some time at it, shouldn't be too hard to justify on 
my end.

