Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B266D1037B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 11:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5lDPV95vs0qVoBBJYSuHnv+zdRK6P0LP4DS6+lF/sVg=; b=EUO5xoZNZQhdQIJypp6C7wEU+M
	eCv3ckAhHeeFkQ8BudtMxzOoEXgebNNEAXEUDHkT4g44KLw2oQCSWt3EAO6SnM8IGF6xO9XGqy4C+
	ZrSvO+Fu2RaNBiecl7zDfDpV81BU4mwNLZWIk1BKWyTXFmvBvnBsjtDmwGyZHI98tz9P60CrTxHhk
	Jb3Xx0nD+vArKQNRMUpxbBAeoIfisWFcHal439KGnXpPzLHtX42oaaIyXoaFW6h3utA8OMFfRdS06
	0tNm2sWGZKjW6IEEQodkIUeXeZ+EqYgyyP99IK4lesRJNttyQpQHes4TzByFBPibQzKjSjOGicSZ4
	7BUCIMdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODfj-0000000EuIq-3uuq;
	Wed, 26 Nov 2025 11:26:55 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODfh-0000000EuHw-1FqI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 11:26:54 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vODff-0000m0-Cc; Wed, 26 Nov 2025 12:26:51 +0100
Message-ID: <28e18785-1336-4fbc-9f2b-69aa6bb06375@pengutronix.de>
Date: Wed, 26 Nov 2025 12:26:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/8] kbuild: Allow adding modules into the FIT ramdisk
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Simon Glass <sjg@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Masahiro Yamada <masahiroy@kernel.org>, Tom Rini <trini@konsulko.com>,
 =?UTF-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
 Nicolas Schier <nicolas@fjasle.eu>, Chen-Yu Tsai <wenst@chromium.org>,
 Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Kees Cook <kees@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Rong Xu <xur@google.com>, Tamir Duberstein <tamird@gmail.com>,
 Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251119181333.991099-1-sjg@chromium.org>
 <20251119181333.991099-7-sjg@chromium.org>
 <20251120084201-53a3c98f-6a3c-4116-8635-be67d58fd57b@linutronix.de>
 <CAFLszTjsgkPV_-Si79RY5T_Fxd5+f-b1VbpG11uS3E9Lk4Ofmg@mail.gmail.com>
 <20251126080620-921e6880-cacf-44c5-bd8b-f380fbb8090a@linutronix.de>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <20251126080620-921e6880-cacf-44c5-bd8b-f380fbb8090a@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_032653_427963_4BCA9D27 
X-CRM114-Status: GOOD (  29.24  )
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

Hi,

On 11/26/25 8:16 AM, Thomas Weißschuh wrote:
> On Tue, Nov 25, 2025 at 02:58:12PM -0700, Simon Glass wrote:
>> On Thu, 20 Nov 2025 at 00:49, Thomas Weißschuh
>> <thomas.weissschuh@linutronix.de> wrote:
>>>
>>> On Wed, Nov 19, 2025 at 11:13:27AM -0700, Simon Glass wrote:
> 
> (...)
> 
>>>>  quiet_cmd_fit = FIT     $@
>>>>        cmd_fit = $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
>>>> -             --name '$(UIMAGE_NAME)' \
>>>> +             --name '$(UIMAGE_NAME)' $(MAKE_FIT_FLAGS) \
>>>
>>> Remnant of a previous revision?
>>
>> The flags are there to allow extra options to be passed if needed.
> 
> Are they necessary for the module functionality added here?
> If not I'd put them into a dedicated commit.
> 
>>>
>>>>               $(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
>>>>               $(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
>>>> +             $(if $(FIT_MODULES),--modules @$(objtree)/modules.order) \
>>>
>>> I am wondering how module dependencies work without the depmod invocation
>>> and modules.dep file.
>>
>> We have a mechanism to place a pre-build initrd with the filesystem,
>> etc. into the FIT. But for this particular feature (suggested by Ahmad
>> Fatoum) we are just providing the raw modules. Presumably another
>> initrd would be needed to provide the startup files?
> 
> modules.dep is more than optional and generic startup files but an integral
> part of a module tree. Without it, any module depending on another module's
> symbols will fail to load. Also the modules will be unsigned, potentially
> making them unloadable.

I'll use the occasion to elaborate a bit on why I thought adding modules
is a good idea.

- You have a system boot from FIT and maybe even a r/o rootfs
- You want to boot a different kernel without any userspace changes,
e.g. to bisect
- Fortunately, you have a build target that generates you a FIT with
kernel, enabled device trees and all modules (including deps and such)
- In the bootloader[1], you specify that a CPIO with a minimal init[2]
that bindmounts /lib/modules in the initramfs over the rootfs modules
before pivot_root

and that's it, you are running your new kernel with the old rootfs
unchanged. I believe this would be really handy, which is why I
suggested it.

> Ahmad's patch does produce a complete and fully
> functional module tree by means of 'make headers_install'.

I originally thought that we could generate the CPIO normally as part of
the kernel build and then we can readily depend on it in the rule that
invokes make_fit.py.

If this proves to be too cumbersome, I think it's already an improvement
if the user can manually run make modules-cpio-pkg and then make
image.fit with the initrd specified. A single target would be neater of
course, but I didn't intend for this to stall the series.

It can always follow later.

[1]: For my particular usage, I intend to extend the barebox boot
override mechanism. Currently, it's possible to do:
barebox$ boot -o bootm.initrd=/mnt/tftp/my-ramdisk.cpio /mnt/tftp/my-fit
and I want to extend it to allow appending any number of CPIOs:
barebox$ boot -o bootm.initrd=":/mnt/tftp/my-init.cpio" /mnt/tftp/my-fit

[2]: The bind mount logic for the initramfs init will probably go into
https://github.com/pengutronix/rsinit, which I can compile once per
architecture, put into my TFTP srv path and then not have to worry about it.

Cheers,
Ahmad

> 
>>>>               --compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
>>>>
>>>>  # XZ
>>>> --
>>>> 2.43.0
> 

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


