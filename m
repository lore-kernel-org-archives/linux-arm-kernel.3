Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA92CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Oct 2025 04:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l9ES7sgSCHDlhobwO0ZrFKVNTVshI11voBNNIhtfWjA=; b=PrKSIQFD+xwlrcBXI5Gwu/VBjY
	F0vTPiwZtmmLqw/9coC3DCtR9kQzmAtmsbAF2lBY3CIlX4En/LwVDzHSyjnZFtJRNQoNCvSPmtasb
	VpxggZZdKdxblxGiTZlDCfBfOLBC2ROOOZXSZBvsFkpYQ8ZnuON1y+cFIVd/0g4NFZVRDlZdpCbpw
	nV/q0Ij6l0Q7GsJN8BriWLpxNBVdh5+7k/PB5dUhBAaXDeIm4a8NPnO7sZ8Z6C6riAH9PNkgaj07i
	uaPrp+2LRxp0x0Eo9cRivDsauLPbdOTAQR28HDHE1U+nnBMP0hnGmMVKO5EBrlPRj96FzVwk2kSxO
	TveKbUWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5GmL-0000000EERj-19j7;
	Sun, 05 Oct 2025 04:55:25 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5GmI-0000000EEQy-2vw9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Oct 2025 04:55:23 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-78af743c232so3062775b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Oct 2025 21:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759640121; x=1760244921; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l9ES7sgSCHDlhobwO0ZrFKVNTVshI11voBNNIhtfWjA=;
        b=XCHP2SqdG9gc0BPKPfRlqU2lc2loiR8yWWsDq3AAfGr3e9ldOypB/X1TUhc979l/TS
         PTthhGDyr/9ZUj100g+ZZaTGKJ7qRLZUSkAA1dxrI264Mn8hnKh61we3fiMKQzTHb01q
         5C1P8dATm4WeAUOnjVebx62s6DEAJPCySBABas0yQN0ID3eoLwwlyc9p5EAbzk+81J5d
         tR04+K3rl4yK2htvyvMgkrCa2mfFr0aYK/hvIjW7q3NoCqgu4ZlqFqb55xp9zERN+Xkv
         IayByTK1X7KY8cmCf1vYXaZRNxIumIGOBX4eRcJSa9IO0v3SQoggUeaJczo+1hfPseiG
         qYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759640121; x=1760244921;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l9ES7sgSCHDlhobwO0ZrFKVNTVshI11voBNNIhtfWjA=;
        b=bZznvPzdMk3/emMNOLkmaACNu3MTgqlLOY+VmcsSK5pT9Aj2shnEY1ANVmxzz+//qk
         lDv177Lx5D16HUJcejuTxcIa8Vh4sQicWtPv4pZKwkCQxj8kqFdfpzqtX8aD/GuLSs0/
         A9INkPyaJ47Y7354+sinchQmMhMvMhD8LomDP+VjE+5ll4flpM6upVJmPV8Tv8eaDibo
         wU9SxagWwNqEz7g2kZCOnHbP/vTr9NcsN9qGln4ebt5Pvipgngh289jCPQ1+/iNHBlm9
         fx71BnBTHhuMVuZ1SYZgNZYw0RC3iG3S08sX+02BihkAI4DxsPXPWPvcvVMn1YB/3VRI
         ycCw==
X-Forwarded-Encrypted: i=1; AJvYcCUfS7md1FnovLyHPNZ2n037Mwe5AYjCwfKnsSlIyA3D9y6btSe+bIAFxApHrNHeNlK1AgkmCTcOCOmCO767xyQU@lists.infradead.org
X-Gm-Message-State: AOJu0YzwzLg/kG3O5yWiF8Orcdnl2OkRp+wFho+jVwBnH9/YjXnHgQt5
	QLMFfRAVMtiyL91Qu48F9VoZ/b09hywumDk9SZiLsC2RfUie53PtWpx0
X-Gm-Gg: ASbGnctDzwPfFj/UfG6KQsDnSqqFJdxYt8spN8JUqDfYESiBXC3xmooX6gzcp29FjJp
	9UtQWPQh+vU6rF8n+VwopjrzfuoCXjE9T8eapoz1JTN5Hg5k0pRjFDb2s8xXbHDXVZupZJmMK8q
	KXVB6kvfuYfMnVG90oERzlaajf2r7WjCuRtlHcdwOWy3sdTqnxXlgOti6atgri9L4f/jDWjbaPz
	gbzi/zv/skeaZ5R2Vwgi/xDEbT2bzPC3KPF+QuNW56fQ9HWBd1+ZZIdoMsGwD5Eb//6/8tH+zup
	8X4GSOma63sAPonFUmSkUpYSN4UhKrfa/wWrKq/Qld9RV4+jVsErSxfqVWpbMCX56HScBv1G7aE
	IM5tK2KEOrIXf7lEH4/9B2r2oRQMlx70ruj2iiFwEs24m1ZpYyZ/CZSS/XYD+G7ERLUB5MD3l02
	QmHncBvhPSHaI48xoEA9xP6bmoYVnZLwWPxWo=
X-Google-Smtp-Source: AGHT+IHrXDCzsLNximokCsFX8BTq6/xEQSVOcieVuoemZgV4yRTvna8trHt71DcqUkLSfovmVG7MFg==
X-Received: by 2002:a05:6a21:999d:b0:2f6:cabe:a7a8 with SMTP id adf61e73a8af0-32b6209626amr10163253637.32.1759640121168;
        Sat, 04 Oct 2025 21:55:21 -0700 (PDT)
Received: from [192.168.68.61] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099d4cfbesm8686558a12.28.2025.10.04.21.55.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Oct 2025 21:55:20 -0700 (PDT)
Message-ID: <37f2603e-8c51-4f92-a7af-0e60cd577004@gmail.com>
Date: Sat, 4 Oct 2025 21:55:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Upstreaming Pinephone Pro Patches
To: Dragan Simic <dsimic@manjaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ondrej Jirman <megi@xff.cz>, "Leonardo G. Trombetta" <lgtrombetta@gmx.com>
References: <20250921-ppp_light_accel_mag_vol-down-v3-0-7af6651f77e4@gmail.com>
 <53eabe34a310ea9c74315fa09a604e4a@manjaro.org>
 <b01ed528-8b29-4a6a-bdff-88f2e3b5dd2e@gmail.com>
 <115da845d9161e6ecfa67cf189b84aa8@manjaro.org>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <115da845d9161e6ecfa67cf189b84aa8@manjaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251004_215522_742561_8E3B1337 
X-CRM114-Status: GOOD (  30.35  )
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

Hello Dragan,


> Thanks for improving the patch descriptions in the v4 of this series.
> I just went quickly through the v4 and it looks much better.
>
> It could be said that the new patch descriptions are now a bit too
> verbose, in the sense that the test procedures and their results could
> be summed up a bit better in prose, instead of providing the "raw"
> inputs and outputs.  However, it's still better to have those, than
> not to have anything.  Writing good prose is a skill that usually
> requires learning and practice.

Awesome! I was hoping that others would comment on the testing I've done 
(especially for the accelerometer and magnetometer patches) as I can't 
tell if userspace is wrong or if my testing/conclusion is wrong. Mobile 
Linux is very early stages at the moment, and I suspect the Pinephone 
and Pinephone Pro were used as reference devices with Megi's downstream 
kernel. Wrong mount matrices in the downstream kernel might be affecting 
userspace. This means that with the corrected mount matrices in this 
patch series, userspace is slightly broken (eg. since I fixed the 
accelerometer, the screen in Phosh and KDE Plasma are upside down. I 
suspect KDE's Kompass and Leonardo's compass app might be the same if 
I'm changing the mount matrix for the magnetometer). This is why I 
decided to showcase the raw values in my testing. If my testing is 
incorrect, please feel free to let me know.

I think I will leave my testing in the commits itself this time. If the 
mount matrices are correct based on my testing, it will probably be 
helpful in the future in identifying why downstream is slightly broken.


> You haven't done anything technically wrong, but the way you submitted
> the v2 and v3 made them feel a bit like you picked those patches from
> some random place and submitted them to the mailing list without really
> understanding the subject matter.  In other words, it's the contributor's
> job to convince everyone else that the submitted patches are fine to
> become accepted, and the v2 and v3 simply lacked that.

That's fair. I was under the assumption I had to keep the patches mostly 
in its original form.


> I wonder how would some forge prevent "spamming"?  It isn't about the
> possible "spamming", but about the act of submitting different versions,
> which would be present regardless of the way they'd be submitted, and
> the reviewers would need to be aware (i.e. "spammed") of them anyway.

At least with Gitlab & Codeberg, a lot of the notifications can be muted 
(I believe updates to pull requests is one of them) and pipelines can be 
created to ensure that formatting is correct and that the proper sub 
maintainers are notified automagically. In my opinion, b4 just brings 
some of the forge's functionalities into an email based workflow, but 
will have to fight it's own problems such as: 
https://social.kernel.org/notice/AypvdTWyAs5km0Gc3k. I don't mean to 
detract from it; it is very commendable what Konstantin Ryabitsev is doing.

If there are concerns about centralization, there are alternatives like 
Radical. I heard that Codeberg is looking to also decentralize in the 
future as well (Maybe using Radical's protocol? Not sure). If there is a 
call to action from the Linux maintainers about looking into 
decentralized forges, I bet there would be many projects excited to be 
used by the Linux kernel. It will also help get new people excited to be 
involved in the Linux kernel and potentially become kernel maintainers 
in the future

I think I will leave it at that, as I don't want to further derail the 
conversation from the ppp series.


Rudraksha


