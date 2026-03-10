Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E8DEB107E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 21:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KrG0m0+wGAmylYP6HW5DIMPVkIxjVDO5lBH833IMH8c=; b=Gh0TmndYXTvPX926X7PiQKCIcV
	JEVJXFA7hrxA7gkGpd1VDX/FAMNM0xz9hfy744Wl3dyw+YgvgQ/GjRYt4W+1kTM8A913wHoSsqgjo
	w4n0uktZn5Gpp0zE9kUIaw0fIbofCF0HyHUvdh1FOckI7zX7DQXGXvwjjsqOvafsQY21kCj6+37Bk
	HyB8Z0pxDG8XjLUkFHOfdMnC3p7aPfKMoFz/9Q5/Zfmuca/S9s3inPB+78UG5165jblUPDyre1UAe
	NlU4hQ3goHFQ+pmdjxCk0hpkkQw+FSb/h4K7nAZipWKEBbqB4Fe1ZlBkryc8UZf1bbCm+8z+KjTyl
	6kKtQgTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w050G-0000000AJeF-2sug;
	Tue, 10 Mar 2026 21:52:36 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w050D-0000000AJdW-2Jad
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 21:52:35 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-4670676ba03so1033715b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 14:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773179551; x=1773784351; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KrG0m0+wGAmylYP6HW5DIMPVkIxjVDO5lBH833IMH8c=;
        b=TZ7tytfpEtAJMknliErVuDPziI1EeCiaDnD49RGkn1KZTb4PvRO0LVXJBrUFCOFrKD
         jaIE0zRkVrsxZkvjpLtMZ5SVAAo3YYW3sIBlCW/RVMskoLaUxbfudT1dFTvpTywwnPH9
         cLRSCGKQCZv01NucFEtM3pPmVa5wvVzlwZLGmalnkgJusf5fuoDI5FETtDAlW7SZFu8Z
         knpHvKWyn2h/KjN+CDx17DT4+zKlZQ0heVrkR0Vu8TiVicMTJ6R1I9BpC+WcyWO0jMyn
         FuUbAh4v9RQPZveD77uRzWRv9QAH4QmQB7CPBGUVSAVhkIMbwuWED+qtBJuWZS4Rg38l
         H7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773179551; x=1773784351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KrG0m0+wGAmylYP6HW5DIMPVkIxjVDO5lBH833IMH8c=;
        b=pckkXLWsqtRET2qCDOcuJQgBy0eF9CbELWkbHiQk6T8Al5xvHaCrGwTjONl35inuVD
         ErhZOoKa2LlMS7XaLmxgp4l87EM8AhPbhGnpSqqOPY6r2yeW5RBE08eEJ6R9oVlxFG8r
         aUhcY8TjFS3fTS/kyL3hf+r9BUIPmNKNKarbPbVwtz5X4brFYDu+QswmXqt9cVvrNUDM
         AT1TUEk9DKleVZY1VJKLY5U53q9VSmxFCvL7aqyuLtRl4ciyzmPfvEjA2idYBJhiPjW0
         d46mvugopJop3nsOMc5Un5QQvULZZmRo0QBHgzrDtGfDj4PS3KHDpUJLpl169knb8ONG
         ZEaw==
X-Forwarded-Encrypted: i=1; AJvYcCUDRz53kQAL8JeEJ6TxO+fENEtGlw866hhrz5lZqMI8bckZD0eETBddtq3HTGpA1Fk/98Llhv5XfHtEEZejkFQj@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3Px2laGTBIh4gPETy1dhbez9NuafBoADVuLRBxIa2aIFQgV+A
	XoSv3dfvJJGzNhYF3YTyyIKYlwdffoJGisGfODjv3HndF9UVL30k/o24lsYcuuvBj2A=
X-Gm-Gg: ATEYQzzvXWgIZMIeo/b+Ayn07RKIIzBrvjUiw/8cvSHfQctN42/DVSPw7aJB3TDZYOz
	ITb0g37816sCvQxPw61lcEZjvwSuRd5E2iR5B3FdaNSx5vyYcYzRB9287n88+m2sPkndxcqRbyL
	ZZJWgK3Yt5vdAHi4AAR6PLNK99ZYL977sRtQ6iupMlMfFf6MChgafbTSUeswGNXVAGk4hXoMQnd
	akyhgLL5VdsUna8fHXIe2w5cSFoWDdrvGY9LPefB5h/Yq+e7BBynQDPEESGiv/8IuABBYhbdzdT
	8GgaJV450wm3efz0zK6fEGJMaEIBtlJoqjxXcFcYPbjl/JOF/qHNT0Et9R50DRp2KL87dkXjXWI
	ivQ9jxAImHJyUdc+lV9k1jWjr51HZ+BaPbxqHsSARmpW1zRSQcYoXr7w33AAibknkL6tlHvMBVQ
	+Hb7OflkHNBT5NO/CN0Vr3m5UNn3N5mclyBxmUAdtSCIPn7C5hGe6hfLB+UBisV7q9b4PnVI1ND
	w==
X-Received: by 2002:a05:6808:1929:b0:466:ecc2:6f47 with SMTP id 5614622812f47-4673354b18amr144459b6e.31.1773179551449;
        Tue, 10 Mar 2026 14:52:31 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:78e2:51e2:14b8:2e10? ([2600:8803:e7e4:500:78e2:51e2:14b8:2e10])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46734160cebsm48179b6e.7.2026.03.10.14.52.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 14:52:30 -0700 (PDT)
Message-ID: <79bfac24-dcb4-4fb9-90d8-3ef2393f51e3@baylibre.com>
Date: Tue, 10 Mar 2026 16:52:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] drivers: Simplify cleanup paths using __free
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>, jic23@kernel.org,
 m.tretter@pengutronix.de, mchehab@kernel.org, p.zabel@pengutronix.de,
 tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
 yunfei.dong@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org, pure.logic@nexus-software.ie
Cc: nuno.sa@analog.com, andy@kernel.org, kernel@pengutronix.de,
 kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz,
 marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com,
 hverkuil+cisco@kernel.org, ribalda@chromium.org, straube.linux@gmail.com,
 dan.carpenter@linaro.org, lukagejak5@gmail.com, ethantidmore06@gmail.com,
 samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
 s9430939@naver.com, tglx@kernel.org, mingo@kernel.org,
 sun.jian.kdev@gmail.com, weibu@redadmin.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 skhan@linuxfoundation.org
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260310200513.2162018-1-sanjayembedded@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_145233_763567_1B593474 
X-CRM114-Status: GOOD (  13.56  )
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

On 3/10/26 3:05 PM, Sanjay Chitroda wrote:
> From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
> 
> Hi all,
> 
> This patch series replaces manual cleanup and explicit kfree() calls with
> the __free attribute from <linux/cleanup.h>. This modernizes the memory
> management style and simplifies common error paths without altering any
> functional behavior.
> 
> The __free attribute provides automatic scope-based cleanup, making
> resource management clearer and reducing the chances of missing cleanup
> on early returns.
> 
> No functional changes are intended in this series.
> 
> Testing:
>   - Compiled with W=1
>   - Build-tested on i86_64
> 
> Based on:
>   <linux-v7.0-rc2>
> 
> Feel free to share your valuable input in context of the cleanup API.
> 
> Thanks,
> Sanjay Chitroda
> 
> Sanjay Chitroda (7):
>   staging: greybus: simplify cleanup using __free
>   iio: ssp_sensors: simplify cleanup using __free
>   iio: st_sensors: simplify cleanup using __free
>   media: mediatek: vcodec: simplify cleanup using __free
>   media: chips-media: coda: simplify cleanup using __free
>   media: allegro: simplify cleanup using __free
>   staging: rtl8723bs: simplify cleanup using __free

There is no reason to put patches from different subsystems
in the same series when there is no dependency between them.
It just make for more noise for everyone.


