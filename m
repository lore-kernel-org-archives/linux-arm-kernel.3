Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183D5EA719D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Apr 2026 19:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yv0rJLbh1UROWDenVdSFqMDYps6cJWmt3g4FVjQwqIc=; b=uu0ACGXJ0GDzIh4hmX/z1ZqC38
	jEbaJdpkz8a71Cn+IL6jyz2z3Fb7Ztu3OTsFNq+y78nGe9gbU4jiycUqQTjKy4qUyMybNZBugTSoS
	kuEMLlg8EsdpRdrhV9D/2L7SoCWEn4+kWS7WJR532s/fcnGZmFrr7Hiaq0GxA0Ap/WT6Z5F8I1kms
	3rtB+fVWaQyHIdW/S8Uti0T+blhFlGP2mw80GeDLQrcoRM3hEcAHf6MN7XsklfJLxQ3DK6MwP09dl
	pnfXOtlibKGCd+G6J4vbJrJkw6wYmnJGNVTwIl4EWNP8+Y8M+PE5/lIimcdTKiAhMVnXpWfWW+nb9
	G/n3MvHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEYCx-000000063Mt-2x3n;
	Sun, 19 Apr 2026 19:53:31 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEYCu-000000063MV-2tQt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Apr 2026 19:53:30 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-3870778358aso16363871fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Apr 2026 12:53:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776628406; cv=none;
        d=google.com; s=arc-20240605;
        b=PNAyZq9qlyVVb673Cos9/i3JAG58/p47CaEL+YsEBGqNmH4HSlCuhilKCh+AeIyo2C
         6sMRM6j/jPsf7fQz6A74ITemv8kgSj2S4eF1iP/lnskf78o78lodS6YP4iY3ltSjgUFj
         71aUgK7MrkUTS0mHKULou3yaNxT5CX0w1VtXtVTlZxMMslcsbQh7GT8WZI4W0vQW7KqA
         3XcqPZo8/Hn7Z9LjjByWfv9LE6ejensYH+PLyECulCEoOhZh2PZ9OaLUkL5sUIvKGRl9
         6pk+F+ziKQRQzWO5ox2pRbwMrMGMeqh7JGOpoL+ardDMdMffFe8D+8RieOeaxf591b9K
         E27A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yv0rJLbh1UROWDenVdSFqMDYps6cJWmt3g4FVjQwqIc=;
        fh=9YFjG0UBTV7bYjrb6kJZKHSrQBQhfYvrdLJgc18Ddbk=;
        b=EEY51uMfcqym1f62HqOBf2bmLeQ7PktrLPzgKnH2CxQrgYZrKz4KXxNZXrM1IeZPie
         WgCLrWLQvGUH6xdS8HIhygEZ9eZ0X8lXIoriz//moPwYFAAZ2tqw8mOCQnRljN8pxIhg
         Vkz6z8oXtWGCLYO0vtOhhZKmc3lKMaToFE8PlS6hxAdWvgg6LseN6wByGLCwIX1ADKit
         iu4OUlgLjx0ZXvQnsTH44oVQdvInNTUP25V6l/fsr7Oh4DO2M5E807z/ED3Yj3YtGjfm
         mx9uaB5ZgViM/1mhmcO9Ul9/THTQI/+XikbpLQ3InbFKquBzWSMp+ULLxRA9BGcyMmY+
         FdXg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776628406; x=1777233206; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yv0rJLbh1UROWDenVdSFqMDYps6cJWmt3g4FVjQwqIc=;
        b=D84zfW8nZHy95pLDxjhCpCJHL+5XS1PfByZowiMpGO8I8IvEM0d1oTpYdlW2iihaFw
         figBC+l4wSLMPj1SJJbPEYNsIsSWCCC/1U4j3PPSMjIK3L85Wxum984n+JA7K++MFpV2
         CnPiiYQ5klolVrO+t3VFxFha5h9ANyLk1U/ITvnsB8Z6HZtcIFJ78j/7Zs0iF+rlsra+
         mwBYcUSFdpoN2p6OU1ed69cqeV6a0+erPmQWlLqOA7GOFudpKji5sOO3xA/Fd6B9BEl4
         0zijLocDptGK3zGRjLW/1/bldikiwrPA3BajI5X75aEiAgxAZrzPi6BKErngqlbxmKSi
         kswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776628406; x=1777233206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yv0rJLbh1UROWDenVdSFqMDYps6cJWmt3g4FVjQwqIc=;
        b=pvAtmngF0bWSvSKZznbfyAs0i1u3CNx9pEOftg7kQszJewv/4jismZv0ZSJ9205Ogd
         366Q3WQvXjIp6W8YTH5Ew/LPTWvltzdm+sdLgVnZyE9lr/bZaTtRC0IyEefRRO9qZgcS
         oHg/xs48i3nvGzhgpQTm6TceZQZB3OxyEgoZP/s60IdoXmdPIBf8LwRyMAaz9L7nlFMb
         yTINJw+9T8YO4yWyyX1Usp0nw9WmzhN2qekLPf2eT4tQ8hPG/yL47clcvasDPUJMmHFa
         eMfnmnBGhi4I6UCLybaqxBKmN0HrsD2SHBohjsR8ZEk6cF41qypY/ZXZW3Oho3xhUKlS
         1hkQ==
X-Forwarded-Encrypted: i=1; AFNElJ/YjaIPO7W/4ZK3h4ChKy5ND4EBRbKn0fDUujD9uLHKPg1mWRcP8bHxxdHSHb5/ebmv/9LuiH7GFRzeS20NS46f@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz2UP8uT4z/vsQpYInKFvkAVE4/FVw/6UPWV/B95GC505yFt0I
	EFYPJ0dU6b0nl88Q7lqjnv2aafUQbLGbR0UUv3nd19MwhyAx7piXxfzL/Vs/HgYHrVIS/7CfCen
	hTL2YjucC5xTtS1im9kuhsEVLMdUB09s=
X-Gm-Gg: AeBDietDpaMue0zOvrZWa0cayxZbJCtz0CjrCAnLZGgBTbF3YQEtHSXVwONc/B4wmWw
	sGIFOAU412m6pGkInF+cZF+E+ebcZUaH+eB/bF4VRzDvIS0FpSsRKwQdbs8Qq6bfqdsO15joJ4A
	pn1NEgCpGBuXmkophbafqTPMNsV8UOUrVfMtlvWWF0y27S3IpCZOqhGRGsOgSTpyVboL/RX2LYw
	8LAfwm8mRSl4R2+kgdxMIKlhEYeihTBOgLzfBhfEZhvkTmJPtreYFnOmrorfziniA4fDl4vBwcD
	m+OA/hiNZBdBhtpUZIvs+/p0QKYqJhM8JICUxlvi0P5i1gaKwaFcjcHqdpy8W2ZD6oLXktBAshI
	dJa104A==
X-Received: by 2002:a05:651c:b10:b0:38e:7c63:57b with SMTP id
 38308e7fff4ca-38ec7b4f659mr30733761fa.32.1776628405403; Sun, 19 Apr 2026
 12:53:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5CSzvBdgN5b5E0v0DB1FT4481pRTwoQJ9YzC8yMt81kmA@mail.gmail.com>
In-Reply-To: <CAOMZO5CSzvBdgN5b5E0v0DB1FT4481pRTwoQJ9YzC8yMt81kmA@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 19 Apr 2026 16:53:14 -0300
X-Gm-Features: AQROBzA-gAphu-v55YBp8axcKiNPna_wNmYf-pyZUNcFOkUsM9HhOBWFmmAsxaQ
Message-ID: <CAOMZO5C8SyLCmWo-y8X_Qu-WpTd51G93oxFqXeBza8hnov84=Q@mail.gmail.com>
Subject: Re: Testing remoteproc on imx8mp-evk
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: NXP Linux Team <linux-imx@nxp.com>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_125328_750976_655A5E6C 
X-CRM114-Status: GOOD (  14.98  )
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

On Wed, Mar 25, 2026 at 10:48=E2=80=AFPM Fabio Estevam <festevam@gmail.com>=
 wrote:
>
> Hi Peng,
>
> I'm trying to use remoteproc on an imx8mp-evk board running mainline
> U-Boot and the mainline kernel.
>
> Could you please share a simple Cortex-M7 .elf file I can use for
> testing? Even a simple Hello World will suffice.
>
> It would be helpful if we add an imx8mp-evk devicetree overlay that
> includes the described remoteproc nodes.
>
> Could you please share the remoteproc devicetree?

I used the remoteproc description as the one sent by Marek for
imx8mp-data-modul-edm-sbc-overlay-cm7.dtso:

https://lore.kernel.org/linux-arm-kernel/20260407211850.79881-4-marex@nabla=
dev.com/

I had to manually build the hello_world_cm7 SDK example, and now it
loads successfully:

# cat  /sys/class/remoteproc/remoteproc0/state
offline
# echo hello_world_cm7.elf > /sys/class/remoteproc/remoteproc0/firmware
# echo start > /sys/class/remoteproc/remoteproc0/state
# echo stop > /sys/class/remoteproc/remoteproc0/state

# dmesg | grep remoteproc
[    0.197328] remoteproc remoteproc0: imx-rproc is available
[   82.061452] remoteproc remoteproc0: powering up imx-rproc
[   82.066846] remoteproc remoteproc0: Booting fw image
hello_world_cm7.elf, size 232592
[   82.067105] remoteproc remoteproc0: remote processor imx-rproc is now up
[   99.565501] remoteproc remoteproc0: stopped remote processor imx-rproc

