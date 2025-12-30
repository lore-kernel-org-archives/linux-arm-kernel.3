Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A858EE57C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 23:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ZRg1doJmXxLNzyi9m4dAo35YsgsZxHf7TH/2wMLs8I=; b=PkIyxDk+HhI5VyGn4nMgrQyxg+
	7CTSMtOAZA8vIDvrtV9wykhhUVAaMsp6l36YGJ08+K+3Tt17NW2BYirfxVg+TdhwnjfVqcRgXMue0
	+UrFJpe3cWscyHpDMTeOynAGbCjcYsjaf401Z/B76bDoMERRVmBpz5vt4M+L2xMITOEcnMvAmqMym
	5jv9zGIreve8e2VG0+7+0JnJi7gKjP06i9EP3DyZ78bNbUfczntvSL/F1xJmEqksD0jJ2EJJJ6w5m
	fU48udGHSg46LEehYqm87W+y5wduAcZZF2xOnotu4S0dNgzlrcrdcbiJfcs9tZmvChvczsMuhSJUw
	O2VF97fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vajah-00000005Thw-0l3L;
	Tue, 30 Dec 2025 23:57:27 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vajad-00000005Th0-3bI9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 23:57:26 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7c52fa75cd3so11768619a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 15:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1767139042; x=1767743842; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9ZRg1doJmXxLNzyi9m4dAo35YsgsZxHf7TH/2wMLs8I=;
        b=F1jHHP1yF8KxGS0MaJUGWdfnsoKRk3CW1Bp0tnXMgaiZNKu7RhtErjjXlI04AhPoz0
         +ZcyPkOOSjG23Pyws5JR08Uipigp8VcbN3ok/gEYPSzNXcqY2pd6i+PnglBg3qOzDPg+
         NGLvKzkU1aH9tpP/XPZ6uJOo1V22kurCfl3NI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767139042; x=1767743842;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ZRg1doJmXxLNzyi9m4dAo35YsgsZxHf7TH/2wMLs8I=;
        b=Z1eJIYDGUUhRTOhyX3zI+61syXqb4iQnFCuM7nG85rUG0VmXku6w6tNL/H5mTTYPZ9
         9elNx2EARVrXJjZiJYm0pxPC7um2tpU0Mmf5zg/LTA0F+Ap7PmXZTym6JkIvmYhiF0iS
         ErPW1+9h8xqYDFBzuygjpZf+QRPmkhXc5VXdNg5vNF0Xc5vMlIjoIhq0okhfUmaJPeve
         ebLDfhyIW9SwEHKdJ+4+ixqDGzF4swX8YDUB1Y5Axb8AwoGpACWb6aROi8rylzM/Vq/y
         y4REAjyPWnOszNV9R8KBlEn8QHYMv9fLSZNASszGKO3OCpIYHhVgxQT/blvvIXQuCcjt
         /AtA==
X-Forwarded-Encrypted: i=1; AJvYcCUuGymj8Yo9VJV/J7SViYwV7Uyq09iXC1w+F4yPnhgZcj/dMLuvwwS9CvxHkCxVxiBXrzPc9nVZuuGWmybWD1MP@lists.infradead.org
X-Gm-Message-State: AOJu0YxhVHrwBuoSxCCGA1TmIEOvIycNA/DBwuzEMufUNkcFTPQ/ayDz
	E84Ge5AYMi+6hOeP4lmMJp9bx3OeONBASyr4KN7FmlSLO5rcUFaGXH6WL/YvKRHRteE=
X-Gm-Gg: AY/fxX485cOr1z2RdflvyvqmGH4PRoEZcPVqkBxMfL7caZTSXMdVXy8jkF9SjoPWk09
	8U1Wh1BXjrCvrifu4mRq5nJiU9R8WF2jpKMGL2/D1hESObnc7ul6ksmwNO6bNSdoNDiqwjOoTo+
	rW2PgTSgci4sPtIlQaJ75jvWgSd/xtOjmVrTU73JNWR9Noyu2YSafKfiGCi5jRZq1pEp1JQD2Dw
	daMEVZmnvfiQgTV2R336X4Yc4CG/dfhCshhBcxBITWdxys9Sd7CqTxis0TPQIt0AUKuNMAeNwxL
	kY2LCpD6VFNGaoYg0pFDvaGQfXMDgBdoV9WKwH9V/VNx1kxZCTqV2TPu1THLyJX/ybzcn/HcrY8
	8w8bdM3R6HI2eFew+oLBGAK55DjP+vdlwdcrDvoc2BNQQCE57ti/CJIMlXxoRWnUDbOfcnwSKBs
	krMwOyWiznJnP3BAE07uZdzwM=
X-Google-Smtp-Source: AGHT+IFWzRYyQNvTNkw9RmEVarae7rk5zx6WELg3Z4a91hRiSu2BAOlPWkJeyCXLdCBX204JSS8o8g==
X-Received: by 2002:a05:6830:43a4:b0:7c7:6da2:6d67 with SMTP id 46e09a7af769-7cc6689d9a3mr23413145a34.3.1767139042078;
        Tue, 30 Dec 2025 15:57:22 -0800 (PST)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc667f958asm23072914a34.27.2025.12.30.15.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 15:57:21 -0800 (PST)
Message-ID: <c1304430-dd7d-437b-8744-70af9ca85c0d@linuxfoundation.org>
Date: Tue, 30 Dec 2025 16:57:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux 6.19-rc1 mediatek mt7921e broke badly
To: Matthew Schwartz <matthew.schwartz@linux.dev>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Eric Biggers <ebiggers@kernel.org>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 Mario Limonciello <superm1@kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>
Cc: quan.zhou@mediatek.com, Felix Fietkau <nbd@nbd.name>, lorenzo@kernel.org,
 ryder.lee@mediatek.com, linux-wireless@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org, shuah <shuah@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <d7f3b00d-beec-41f0-b157-7cfb871f9a46@linuxfoundation.org>
 <756e3f65-b2f2-4da3-985a-17754a7a872d@t-8ch.de>
 <CAHk-=wjO-7uR5HBi-MFnkxAxjhpgfbAQ+HCMKPiXFVwM+AJ7tA@mail.gmail.com>
 <6fc04df5-b753-4b2d-b978-0e59a7f48ff7@linux.dev>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <6fc04df5-b753-4b2d-b978-0e59a7f48ff7@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_155724_326306_FCF6613A 
X-CRM114-Status: GOOD (  24.02  )
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

On 12/29/25 21:21, Matthew Schwartz wrote:
> On 12/29/25 4:41 PM, Linus Torvalds wrote:
>> On Sat, 27 Dec 2025 at 04:25, Thomas Weißschuh <linux@weissschuh.net> wrote:
>>>
>>> Hi Shuah,
>>>
>>> On 2025-12-27 02:07:24-0700, Shuah Khan wrote:
>>>> mt7921e doesn't load on my primary laptopn on Linux 6.19-rc1 and problem
>>>> still there on 6.19-rc2.
>>>
>>> This should be a duplicate of
>>> https://lore.kernel.org/all/CABXGCsMeAZyNJ-Axt_CUCXgyieWPV3rrcLpWsveMPT8R0YPGnQ@mail.gmail.com/
>>
>> Hmm. I wonder if we could instead do this:
>>
>>    --- a/lib/string.c
>>    +++ b/lib/string.c
>>    @@ -113,7 +113,7 @@ EXPORT_SYMBOL(strncpy);
>>     ssize_t sized_strscpy(char *dest, const char *src, size_t count)
>>     {
>>            const struct word_at_a_time constants = WORD_AT_A_TIME_CONSTANTS;
>>    -       size_t max = count;
>>    +       size_t max = count - 1;
>>            long res = 0;
>>
>>            if (count == 0 || WARN_ON_ONCE(count > INT_MAX))
>>
>> (intentionally whitespace-damaged patch, because I want people to
>> think about it).
> 
> I gave this a try on its own but I was still experiencing a kernel crash:
> 
> [    3.339408] strnlen: detected buffer overflow: 17 byte read of buffer size 16
> [    3.339804] WARNING: lib/string_helpers.c:1035 at __fortify_report+0x41/0x50, CPU#14: kworker/14:0/105
> [    3.352248]  __fortify_panic+0xd/0xf
> [    3.352259]  mt76_connac2_load_patch.cold+0x2b/0x95a [mt76_connac_lib 8f0d0f7b30f881af23462dac0a8cc5ff88d08cd0]
> 
> However, applying a similar diff in the fortify wrapper does prevent the crash:
> 
> --- a/include/linux/fortify-string.h
> +++ b/include/linux/fortify-string.h
> @@ -306,13 +306,13 @@ __FORTIFY_INLINE ssize_t sized_strscpy(char * const POS p, const char * const PO
>        * This call protects from read overflow, because len will default to q
>        * length if it smaller than size.
>        */
> -    len = strnlen(q, size);
> +    len = strnlen(q, size - 1);
>       /*
>        * If len equals size, we will copy only size bytes which leads to
>        * -E2BIG being returned.
>        * Otherwise we will copy len + 1 because of the final '\O'.
>        */
> -    len = len == size ? size : len + 1;
> +    len = len == size - 1 ? size : len + 1;
>   
>       /*
>        * Generate a runtime write overflow error if len is greater than
> 
> Not sure what the implications of such a change would be relative to the proposed
> fix here: https://lore.kernel.org/all/20251205161202.48409-1-mikhail.v.gavrilov@gmail.com/

+ adding Johannes to this thread also.

Reverting the following fixed my problem.
  
f804a5895eba ("wifi: mt76: Strip whitespace from build ddate")

The above fixes an extra newline in the dmesg by making the
code more complex it needs to introducing local buffers and
strscpy() - the proposed fix replaces this with memcpy().

Is there a simple way to do this than introducing memcpy()
or strscpy() to remove an extra newline that might or might
not exist? Why not check if newline exists or not using
strstr()?

I would recommend reverting f804a5895eba instead of trying
fix it. Then find a better way to eliminate extra newline that
shows up in dmesg when firmware build date happens to have
a newline.

thanks,
-- Shuah


