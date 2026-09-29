Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3771FCA5FAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 01:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BbPZBkG6EW7o76TGvb+IbEd7phIKmf02Hwna+vyhxaI=; b=Usdzcu2+5XD6SUE9nizYu+2jMy
	6yvJ1oDe8HlK5SX7l4E0BUIJSY+mlzJ4gC6fCi2AabqROnwYBD3c8hJybQpEkRa4vjtmVZ+KP+CIM
	3+bzrscLsnuwrzwmR6jKWzZMqBByjWGGwzdpgKXiuLFN0I5hPFSPTFuwfco923Ilzgrruov+VAXk5
	QEMkrXeqIH4dLgs0b44JBbBtRyLtTDTdec4VySSoE3DVzZdBF8BN1sTuurlrTQnEDYK1dXQgLTdIf
	a5n8W7UNj0KpCXuB5J9Zqq66ZLOBycaMQRFYbazB+E339FIaDtCT/QJFCa7+03EGZLwX8pB3PXDAH
	FjrmMGzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBMuB-000000024eE-1Li3;
	Tue, 29 Sep 2026 01:45:15 +0000
Received: from mail-pj2-x0d.google.com ([2607:f8b0:4864:39::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBMu8-000000024dp-3pMR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 01:45:13 +0000
Received: by mail-pj2-x0d.google.com with SMTP id d9443c01a7336-2df964b6893so17116905ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 18:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790646311; x=1791251111; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BbPZBkG6EW7o76TGvb+IbEd7phIKmf02Hwna+vyhxaI=;
        b=dgeIbKMz0WUsvMwlE3FcDvvz3w8zOQ8MYP6rZ3GG8HApUXbp0bNZhlxSdmkalaORSx
         6mqOtYoSqHv02Cu9SLBAbiWofHcEmVvJ/r3htgcO9BdOaL1hN6G2q4FQw3pezBLPfEj0
         Yi46x5lemUvaX8Q0AtJx3KRjNnsxEmg+almXkIezKGOcsrs7q15oGqLfWc7GCo4Ik5i8
         WiJVAPocMYq6Rk7xopO/oP6p1qzf3m+pI5uef1Z+azmZ0y7TtuyasMO0/tQk8C0cbNND
         1YCG6RABJjoswsPgIKnQKvXNM2c3eJMN6lG2YRCkM4tqhrGnaMI/vceeJJHktuxGMiNZ
         vnzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790646311; x=1791251111;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BbPZBkG6EW7o76TGvb+IbEd7phIKmf02Hwna+vyhxaI=;
        b=BnFKEECaYB3v9x1jQfO82mG8D3oBxAx51iHg8YHh9+0+q5kZ16DW92ozk40zXPFWk1
         n1Vo3Tt++9Ey22fpV6iFiVvDu5KK5MfjE46k7RCpdKE1YscGl4uWKx9bbmMJprxZNnjt
         TtEBEXz5GSc1P2YqlZiw+eE0ODfn3sEWOuYYqC0rRgu1FCP2NjFEZ+zTZbcZcf6XJnck
         hGD4dvyen4Df1170hzao3gUBdI0Ou8Z8ZrzsNSxPj/1VFpdoGYtZRfX7D0Tjgo9LS9PD
         V0/Dx0ofpQ2mRw6akSWpyOMbIJj4c2fNT5CmKEgO7sM6bywPwj0v4m1XidiJvmk5BuZi
         a3XQ==
X-Forwarded-Encrypted: i=1; AKwUvByGPqbZ7wCvUUz32/aB7O9qu1BGTxsy2gtGDgD4+emh0ygYrdB8GwIZyu3LY9DXf8+c3AL1ZBNrSocuvVaEnv0E@lists.infradead.org
X-Gm-Message-State: AFq9FYIf7mT3vxhJFGkOQu89RyIwQg2qJvqxSunJLKgHA0jdwRcOmKHs
	966btj2wHQ+XpOt5E7A9skeeqF+xVxYLdJ/zs93vvfFCRbCriR2uDAQE
X-Gm-Gg: AYBFou1kjhZtsSLPD5aqQ+POKeo6VMNvZAWHrsOj2ftrjLg79FW/RX7QWavHMfQQv6E
	mll2ON3Ie6eskGVguwKdIrtQjrAPZY9L5hbFNewyio6Txi0EikkVTdXnhLasfJyRWuO8pGZ2VZG
	j5JMqlt1IyMlvJW+qDOXISjI9c5aBO5O4ep4E3STB4kEk0p+iTbvs0Y8VtHUo4hhSRprNYDLfAh
	H/47gfsOPM/KK7tH/fLszhJ6Kh5ZdRXqG3kj5NSfxdXFBBbdS8idibu/ZYDoKI9N4ZKXrIbZaW2
	/kvfz+FOluWaRR9RsbuCB+3L9gAatuoIXOCYW55nNyc97q8ksE5hz1A99BsBP27nZPjwxQvQOhp
	PWq1rIzH8J/cf2U/9BmHd89X4VoiFXKZhT9Db0xp0Z6zWbDqWWgdJstgN2GsZmPxSJ0LwXWEqMm
	urlNr6OJTEBGdeZTdtrZYHjfZ4oF3M7PAjFL8GfLJG2ix/annqMILDebAht5rFbTLU8uvLLmfCg
	kba2gp96JkpZe6KnoJ8ydA4idHHhkikBkpqk8hTkhwLZ/cZUZeiDdg=
X-Received: by 2002:a17:902:ebc7:b0:2df:9625:3ecd with SMTP id d9443c01a7336-2df9625400fmr82748415ad.8.1790646311363;
        Mon, 28 Sep 2026 18:45:11 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913dd8d2sm48984825ad.20.2026.09.28.18.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 18:45:10 -0700 (PDT)
Message-ID: <ed35ac8d-ebcb-4f7f-aafd-c1b1eb3616b7@gmail.com>
Date: Tue, 29 Sep 2026 09:45:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/7] drm/verisilicon: fix DC8200 primary plane disable
 clearing FB_EN
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260918030125.315978-1-a0987203069@gmail.com>
 <20260918030125.315978-8-a0987203069@gmail.com>
 <4a7b271d2a90eff94c27dec3bf24114ce44df1fd.camel@iscas.ac.cn>
 <1d988dfb-c930-4c17-ae77-47b93ff9f159@gmail.com>
 <cb30f57c0ac124aac85efad32626e6182b9f1369.camel@iscas.ac.cn>
 <b589c197-2297-42c4-b017-3594cdd1cd56@gmail.com>
 <fde43d758a66a8feefc50274f3573e33a67d43f2.camel@iscas.ac.cn>
 <fc425e648644d94276bce7d3d4dac8b0acd4c5d8.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <fc425e648644d94276bce7d3d4dac8b0acd4c5d8.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_184512_961208_3A4FBF89 
X-CRM114-Status: GOOD (  24.30  )
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


Icenowy Zheng 於 2026/9/26 下午 12:48 寫道:
> 在 2026-09-25五的 22:55 +0800，Icenowy Zheng写道：
>> 在 2026-09-21一的 15:49 +0800，Joey Lu写道：
>>> Icenowy Zheng 於 2026/9/21 下午 03:30 寫道:
>>>> Maybe it's better to just make it the 2nd patch in this patchset,
>>>> just
>>>> after the binding change.
>>>>
>>>> Waiting for something into drm-misc-fixes again will need another
>>>> fixes
>>>> pull and another RC back merge, which can consume weeks and miss
>>>> the
>>>> current merging window.
>>>>
>>>> In addition, it's possible that `drm/verisilicon: introduce per-
>>>> variant
>>>> hardware ops table` also gets backported for a more clean primary
>>>> plane
>>>> atomic_update disabling fix.
>>> Understood. I'll fold the FB_EN fix in as patch 2, right after the
>> Should I just apply this revision of patch with this reorder?
> Oh I think more fixes are coming.
>
> There's one more DC8200-specific problem (which might be problematic on
> DC8000 but I am not sure): The vs_dc8200_panel_disable_ex sequence must
> be executed before vs_dc8200_panel_enable_ex, because some timing
> parameters seem to be latched when the value going from 0 to 1, and
> when a stale state is programmed before the driver is loaded (e.g. a
> firmware driving the display) and the timing isn't the same with the
> timing of the first modeset, the modeset will fail.
>
> I'm thinking about sending a fix patchset first, which will pick the
> FB_EN fix here, implement a fix for the stale state problem and maybe
> implement fixes for the old state dereference problems for hidden
> planes in their atomic_update callback (although this fix will
> introduce a helper, which will then be moved and renamed in the DC8200
> ops patch).
>
> Thanks,
> Icenowy
Understood, happy to hold the DCUltraLite series until your fix
patchset lands, and rebase the ops-table patch on top of it then.

On DC8000: its panel enable/disable path just toggles a plain
FB_CONFIG_RESET bit, not the staged PANEL_CONFIG/PANEL_START latch
registers DC8200 uses, so it doesn't look like it shares this specific
ordering hazard from the register layout alone. I'll run the tests again 
after
applying our variant on top of it.
>> Thanks,
>> Icenowy
>>
>>> dt-bindings patch, targeting the current vs_primary_plane.c
>>> directly,
>>> so the ops-table patch just carries the already-corrected code
>>> forward
>>> into vs_dc8200.c. Agreed that's faster than round-tripping.
>>>
>>> On primary_plane_disable_ex - I'll keep the "_ex" suffix. DC8200
>>> still
>>> has a real per-variant operation there (clearing FB_EN + commit),
>>> while
>>> DC8000 leaves it NULL and does nothing, so the suffix still
>>> reflects
>>> an actual per-variant difference, not just structure introduced by
>>> the
>>> refactor.
>>>
>>> While testing the cursor plane, I found the same class of bug
>>> there:
>>> the disable register write was being triggered from the plane's
>>> atomic_update() invisible-branch using the old plane state to look
>>> up
>>> the CRTC/output, which can be stale or NULL on a plane's very first
>>> commit if it's already invisible then. I've fixed it locally by
>>> having
>>> atomic_update() derive the CRTC/output from the state it already
>>> holds
>>> before checking visibility, instead of falling through to the
>>> old-state-based disable path. Just flagging it here for now -
>>> vs_cursor_plane.c isn't touched by any of my patches.
>>>
>>> Thanks.

