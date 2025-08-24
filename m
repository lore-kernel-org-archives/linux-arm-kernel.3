Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE0ECA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 20:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PzQ9jA1Fby2YbaZS5jXHVzwiyZOVSO7XmvZgP8bqEsc=; b=mD5edxlBzmWUSwC5vfX+x12Fcn
	+hvXXLyvH+vVs73wIG0ZeUBhhWfGxTzE9Ak2tMFdBnStiUr/GWpRcoelyLg/TWJHdakrx0G3GSUv/
	HrfvNrSEX/vZhkCELRTISmQvl7tSA9Nf71fZ5SnHzDlvnRueoXsQT5XroOcuhKnI+SpHzFq4OBcjN
	LnI1L3WRlLR/j36E+vGCVO5qCuc3rmAHleEz/xyZKv7ay3atrvlzGYHbR/yqWF7y7fRPScxlzqpgd
	/+8XOYtGttoLoUk1BYTptHJJhx20FZxeU3mMpCJvPlq0QIoyakaoa3vo5Xj9MfwxMtPrYQ0nWVWQa
	PjcrnYSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqGtw-00000006VzX-0WPX;
	Sun, 24 Aug 2025 20:01:16 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqGrK-00000006Vs6-0F8U
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Aug 2025 19:58:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1756065489; x=1756670289; i=wahrenst@gmx.net;
	bh=PzQ9jA1Fby2YbaZS5jXHVzwiyZOVSO7XmvZgP8bqEsc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=QAavvH5+V2HSTu401zSFM3q74fS9wQ0D1RQqexnjUB7WEP+z865XA0bvKPmXiGNt
	 bZFikcXpD0KlgblPbsmZpZELQnTOyu+H0uAB60NNJxhGyHiqJVjpRue1AtNMJ+eBX
	 Pukap0DPRoHoEywDcTg8hRJopfzfy1ILRHXdY3Lp0FnwIn69ArFH6Dd7grCa0QlwH
	 OdtTGg2TjdK7DFK9vdyWA5chJjyI0Epe4glx6voHjm7Ayr0j9HMgbusHKMzUAmEO3
	 pZsr8akrDGSaL614CmqiA0hq/n+i1ujxvk4dbs27UYqKJEE/BgnqxUNVGcTxy3dVg
	 2MyeyNTKahbO8BQEpw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([79.235.128.112]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRmfo-1uwCrb12pG-00UALR; Sun, 24
 Aug 2025 21:58:09 +0200
Message-ID: <8e51d9c4-512a-4b98-8ef7-e08a259cbf07@gmx.net>
Date: Sun, 24 Aug 2025 21:58:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] staging: vchiq_arm: Create keep-alive thread during
 probe
To: MichaIng <micha@dietpi.com>
Cc: arnd@arndb.de, bcm-kernel-feedback-list@broadcom.com,
 dan.carpenter@linaro.org, florian.fainelli@broadcom.com,
 gregkh@linuxfoundation.org, kernel-list@raspberrypi.com,
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 mcanal@igalia.com
References: <0c2840c2-241c-4f98-9518-6a3676286823@gmx.net>
 <dafff4b4-f022-453e-935f-6d79c4c57292@dietpi.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <dafff4b4-f022-453e-935f-6d79c4c57292@dietpi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NnP12uDjpZpIiPyfFwFkLR5acC05W1penX/dLGlqs0R4hvrZUdA
 9UQ86+N1mpmh45ter4nWFbaYbHutvWCqM7AZnTYv09AC35m2InsEaep+vv8fRrbDPi0Jxo3
 vF/IwPDCRcvcTziI/7BLgVaselLEmDc11+C7WK40+IdLTAoqrsQz97jhP3pMPg61TSzoHGd
 OWQ+B/zI8Y406QKYFbdmw==
UI-OutboundReport: notjunk:1;M01:P0:fYfE0T+XdTg=;RZ6Zf7ijead5X6QsS2auyXxQ74H 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_125834_388635_F1259B6A 
X-CRM114-Status: GOOD (  18.79  )
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

Hi Micha,

Am 24.08.25 um 20:37 schrieb MichaIng:
> > Okay, after disabling all VCHIQ users including VCHIQ_CDEV and=20
> enabling DETECT_HUNG_TASK, i was able to reproduce it.
>
> > I will try to fix that.
>
> Hi Stefan,
>
> is there any progress in this regards, or a way we can help? Would it=20
> make sense to share the issue to the RPi Ltd. downstream repository?
> https://github.com/raspberrypi/linux
this issue has been fixed in mainline/stable by reverting the commit in=20
July. So downstream should have received the fix, too.

Best regards
>
> We ship images with downstream RPi Ltd. kernel packages, but with=20
> non-GUI/server setups and low memory usage in mind, we=20
> disable/blacklist camera and GPU related kernel modules by default,=20
> and reduce the dedicated GPU memory to the minimal 16 MiB, so that our=
=20
> users report as well these errors every few minutes on their main=20
> console, until GUI, video codec, or camera features are enabled.
>
> I am thinking about letting one kernel module load by default which=20
> releases the hanging task. But the majority of systems are headless,=20
> and really don't require any of those. Reducing the console log level=20
> or muting hung task timeout messages would be another workaround, but=20
> that could mute important messages as well.
>
> Just in case someone else is in the same situation: I found the VC CMA=
=20
> driver "vc_sm_cma" module to be the lightest way of releasing the=20
> waiting task. Other than the camera/video modules, it does not pull in=
=20
> a large stack of dependency modules. With less than 32 MiB GPU memory=20
> (where the cut-down firmware is used automatically), it fails to=20
> initialise, but releases the vchiq-keep thread regardless. Its size is=
=20
> also tiny compared to the Broadcom camera/video drivers.
>


