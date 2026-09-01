Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70858C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVxT21+okXO7H1rZRlv527+HZuHOBJIShXeskdwzZ5E=; b=BNjd0VP50L37OHXp8EMqKzyC78
	+rUYKSdkZ1Eo1F1auuLI2JuqaKZvebr3NU5qkc0SMW0Z0zK0RWQ9w4TG73mDsMUrb1/7JSS/H7BVc
	aLEeIW0+Tv2xT9q4butnDNkF5x96Ypd01nClRdCIUTXR1ShKVWFTYFGTc3uH9Bkl1Zqzb/+ebctGz
	JFyChxDpPNftrAobMo3BMY+7s9RV51x8e++Q+VQIkrxiyX6wnSdMEcbpxL77MrPfrQ2d1wo5hVygD
	oCewq2xOM1U0fodFH2ACVsY8W3ZrvJa7BUGiAkOAFqSrKKySJb7J44NKD+eH5GaEf4nKgxZ5HYAco
	B8ilirbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TMH-0000000CyxL-05eI;
	Tue, 01 Sep 2026 18:37:21 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TME-0000000CywR-0Pz1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 18:37:19 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6a20319d030so204133a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 11:37:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788287835; cv=none;
        d=google.com; s=arc-20260327;
        b=JsObTBfaiv6XZzhC2GWUyFgkXaarmwIyR6XN2bVa2xQjCLrmZ1PE6chXStYRRsQtK9
         Hk9Uvbcy1vnhzvZwVXNLqovz6WSvjYVNK2UuWS42EFZd0TmO9OnSPvfZXE4Cq8qjP3LZ
         3bs0el1/1rsxT/mUaQmDEGjowumGOQxLdbTM1wHOK2C8pWsf4hkFx7O4vXdBGi3MtioG
         Mp4w84WGMX/dZE/PyIp1Xn+DbEBKJYdTfgzmHin43KQ8aSn4S6H3hUEPaKs2EI7NzuVg
         qlvkVSL2+GUrnaB7w0/XWYMQG/ae5Efa/hIoAKUyBQf4XEwf3nsqM/3raVYgHPfI333Z
         UDkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VVxT21+okXO7H1rZRlv527+HZuHOBJIShXeskdwzZ5E=;
        fh=s3VpvAJD8qsBwh4Nk5YMiLiVtGSuQgEl9L5Cnjd04w0=;
        b=dGcZ2Ri7hJrvR/mzCQZrmad/mz3D4Na7qSCT8L2qpg55y09F0hW8SpzKpM6pZ+WLa/
         PPZ2ViTm878m12Gb1WnEr+yO3JbCuP+NKEZK/axoZMPrAxscut9FZkraZshpyoM9N7Kl
         VSqU1Ko5h4fehOTmhZ9vj0WavVulDFQgsMOqoc/dl0O5fp2vBtvVq1e+kavmj8Hzy2rv
         8qK4SIzfoVQlXhmZb7cinj93UewPV8wRVMYceGBwSdK07icJhwjEyE+Q6QpKMNTqrQg7
         MyEVVCwurZqn4407djgUy+rZDDe6BqZjqHppUAeh9SgMymVWr+EuHUwlow2yPQb0Nkqe
         ZnzA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788287835; x=1788892635; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VVxT21+okXO7H1rZRlv527+HZuHOBJIShXeskdwzZ5E=;
        b=NE3MLhPgU959tGn/GJnxuH7/cXUB/dHVfJkKmw6BNrHxHqXMOxnOwY6MSWEJ2DuYo8
         BwoYfl6XeJQfD7kU0/j8UsGymcEdMtTPY69HVIyQ9srFNrSvjrX/9BxEF1UrBWG/x0mT
         ZzUDfjMycrR/pFRCydYDcKAK32oP1kjuBJEPzkHCNIiP38e+qVdtaRNZXAgo2+SXmugO
         Om/V72LBreTYJzqcREWmqsYR5AO1XzVDn4+sX/ZT6CRzDHd+mumkwsqwQ6Y0veA7WEGw
         +N7kRD5NlUZgnXn3bchN6N7ZV3IklFkDw0+FqVXINWDTOtz6OQHzSIs0qoeJr/uZLOBj
         DjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788287835; x=1788892635;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VVxT21+okXO7H1rZRlv527+HZuHOBJIShXeskdwzZ5E=;
        b=Ez8nZgkTlJOkWiBlBJ30kI2FXAtfgNiPlR7wwynMkj721dL1zFYe411sPffFxxjKbI
         202SiKj4JTbpxg+gY96cNN14TOWMPq6HngJb2GUNTAtZVl7pnbYkqnuGYW78pa5gIocB
         A3ccDdNywUUt5FhCOgOhRiRoxl7oZEjCNNVycyYq3ugX0k3YHt5HvvnaABTjZOyryqjF
         YAqaa0lAovGLuEq/ifF3sJtdII4x+woRNH0RHwXZQFNrh4PiSh/bGC1wUtImU0AwtbAI
         HqftYi0VqUvA69J8SxsXVY9laXK9dm4F+atJLsSifhddY/MoTAnGGmO0YZRr7TO2EOwN
         t+Mg==
X-Forwarded-Encrypted: i=1; AKwUvBzQrL0dHkNBA2yBwCIyz9OHmPta0UlofMGcoHu8e6WDtYq47BlN+wtGyDxr66FprysGBWYcTOuk3b8ZqIcx78MU@lists.infradead.org
X-Gm-Message-State: AFuF++kFXr93qQvg4dv9IThhnum+DkmzRuROegL8zodADqcM0yxe6RVA
	/TMQeqTmFzXhLh0Li9xEaaVnecBJtDiI/9r74RZpFK8ZBpILGqZspbPC8XTLtCyOVbsaAfpktDm
	hztxYaRO3bhBYoAYCiQ9Pjy5We03tLOQ=
X-Gm-Gg: AYBFou0qvKOa1S/ZzFqnt8Ln3/liYGqeIsAvKpqQyUBgBwA1Ww7VNFOqZNrPCA1eYoD
	8hUs5aGyAHR5iyu+voVVCZUG4T+7M3fKHgyzPzLa+cIJXxO5xQziYzI4gwGcfiBaoxDlI/8zyYK
	SPOVSZ0npTSF6lpByFelCVNG1omxggv0f9IRdY77BxKs/SJIZtC7P2OaHZOSqgcwymV5Fu8I7Wc
	kWeqci260pnmrO/VbN2CZey0LhbaE2fT/sb0O90Dih9yJZcXDqmTvSRF7Vo1FHaBEVZBn/SyaKa
	ULRFMAo81pQAaFyFAm8ylO0bHV3a34fYSs3tqFaEL/ExDqAYkZKY7OQBlgNB/UKfZBA2WCLdqvj
	URq8geoTB7h0gHfULL9bpiFtpqXQ4dgb11oF3payXRhzj8ZCSLv9h46KFF7359w1pn0P47cqtLH
	eB0N72bMEipTz5vaWfTpFhF0LMnXrnrgZpUY7UP3PQLm1fn4ZKNcFqdCw=
X-Received: by 2002:a05:6402:c44:b0:6a6:32fa:1e9a with SMTP id
 4fb4d7f45d1cf-6a632fa1f2bmr14643753a12.18.1788287835187; Tue, 01 Sep 2026
 11:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260901025311.955936-1-rosenp@gmail.com> <e1087196-fcfa-4c1f-96da-ef76a3e03a11@lunn.ch>
In-Reply-To: <e1087196-fcfa-4c1f-96da-ef76a3e03a11@lunn.ch>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 1 Sep 2026 11:37:03 -0700
X-Gm-Features: AcwNN1UPUj6nKVtq1cjCz-NC6msW_ZrmBOinD39yYI4g4c84oBstlABPtX9pTQk
Message-ID: <CAKxU2N_qR-KKvq=qv0eu4PMYMf8zHnpYnZ8jMvpBNKVitB3Vuw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: helios4: add Wake-on-LAN gpio key
To: Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_113718_158767_F231726E 
X-CRM114-Status: GOOD (  14.65  )
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

On Mon, Aug 31, 2026 at 8:08=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, Aug 31, 2026 at 07:53:11PM -0700, Rosen Penev wrote:
> > Add a gpio-keys node exposing Wake-On-LAN on its gpio0 18 input,
> > allowing the board to be woken from suspend.
>
> Could you explain this some more. Why a GPIO key? The MAC needs to
> know if the PHY can wake the system, in order to offload the WoL to
> the PHY.
This was an out of tree solution to get WOL working on this board.

After some back and forth with an LLM, the conclusion reached was that
this is the simplest way to get it working, not upstream ready. And as
sashiko points out, it has problems. I'll respin.
>
>     Andrew

