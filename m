Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A8CCA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 09:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PlK2stUccurl04mbWawfAf/ha/VEIfyoutD9WxWnA1M=; b=ecFmLnRtGaWqyWFU8a/DHVep4E
	QEPfUzJZL6rhsP13MOFfTD07a0M92HjsxIF4r4X6jzsikaMOCFrzY47qatOg8bA0RS4deD1MSXRji
	X1yIvnxkm6o8a9cPLvX7s4sKapZvwK7giSL1H2nvst9Vi/9ZBXROktVkGZJ/9IgO99tnsHTSEZPFS
	/2K4jt1LQqIe7Jq9yhSKXEv/BcrOuhDxbK2YyTIMFYB4Tv0SpHoiX8r4A+R2EGjKqn0s3MhNr4rC7
	VdBS4uzSkMyP4u/8LvvX+I0z9R/Bmdsq8kQNarbhKil347caNyuKVCYVsb6vMdZ91HwVWhUPBFSZN
	vkGsq3oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyoBg-0000000AkiL-1SRX;
	Wed, 17 Sep 2025 09:10:52 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyoBc-0000000Akh8-1Vj4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 09:10:50 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45df0cde41bso46282195e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 02:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758100246; x=1758705046; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PlK2stUccurl04mbWawfAf/ha/VEIfyoutD9WxWnA1M=;
        b=h9U8CSKQpI2m2ZflSX3mB/MAy1UdC35NTDjeiheaMBRRr5EO/TVvJxJlbaX6aMfULW
         0aouSFetRBHlIdd0oeHpcAQ1Oe+8fM99Nh3kwqjwK81kR/W86XDJLe5vnAOVj4T/LO1M
         RrhHCschAkKveToLU8USf/ANKmC3HEz0SpBKPJ4uSNiTv5lScfSbySrmnSkSduEr/rm0
         VhGsjL5fns5XFlNt/Ld7WaGNwdCvzVziPNt5n/AxWxrmq4Ptx6cCr6W1ZlKVwLk/XLsu
         jL1Iw4ILbitGbH8xKot1wbBZR7HZgx6KA/bjWJfYuZxaDIK6yEyh1BV2bZlhVx4kHPnv
         tfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758100246; x=1758705046;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PlK2stUccurl04mbWawfAf/ha/VEIfyoutD9WxWnA1M=;
        b=A2gh7KFKSReUm6LUwYeCIqwNcO46ZHJYsmBfTt2uj7+pVWiAcKonTpaV4uoNwfc15Q
         E+9Ff8Hh36nle9A8HluYk5Dt3AwPHZ8+dCEhi1Oo0U64e0Q//+91FqlEmDVuPy6RDqDn
         vCeUybmJgB4BuZrt3EXdqnRJHd7M+aYSJaiauxtxoZ36ZyZ5D3AAe1b6ts1lXJWBhgJQ
         6aT2k3e/4Lf487Hmm5fisi2uX+N13k1lc+BwOQs/iAkh9+Fqrt62jq1dz6gmdKL9TWfj
         KmvjJAI8aFJUKkDeOCKxzgvjnIL5rOqAB3vk63ts0/bNm9RnrmYzOnf88eFn3unnEP6R
         KmoA==
X-Forwarded-Encrypted: i=1; AJvYcCXMCDPL1NIdzBjWwKF1NWFydwUGowF2oEzvEPPeVEQaFD8T5iNaSm5kMuKz0U7w35PN1m9whaw1qBGMf+deU6yr@lists.infradead.org
X-Gm-Message-State: AOJu0YzoO+L0gVDWPpdNJ1M1JSd+9lIwQ/4LGqLY7ri1CbXPSup7PcY/
	22/3gdS0lyoxddXXgy4T0RjYsNb/wUcBifcgDVNWOsUYrdiT5ym2M8xUm7gTy1bDKAI=
X-Gm-Gg: ASbGncsGQY2h7OgRK/2TtgHi2uJyKEs/ZFE9JBlByxWvxY+yYF5GBJAkkTI2o0Ata3n
	Vfk3ccBHKCW5ZwZVNivWqX0NhTpbarrRs8OBa+CQBoHqQ0TUsmVMdZy7dMTVUnMeQtUIjdIVpcs
	NGzlvpVFYZqUaSEVdJVzChkAyyxDde86tcHtr1lzPPPv499BSIz9BlQaxiNFkKw4CnSmuNQgd2K
	nXtNsjy/IPCZ6avYiK9v1gFYwZTez3k8GzmUOZ1+DlFtQ7+t6+JTxOqckm14CPpfr+ZxPbgs163
	8jmmW0CVWLfvAVRdJLrVdb3xhgliENlWAHLXpAGTGgcsg+jr8wYwpr06bJbIDNoMdm7UDBv/XnY
	uOU/kBYbqBr2Kusn09eppmQ==
X-Google-Smtp-Source: AGHT+IFPGc7ic+PrwXQdYuhF8XZWH7tHR3Wzubn/3T39N6UzWqLydVcD4Osfm3AnC6uPAm7ruqpt8A==
X-Received: by 2002:a05:600c:1c87:b0:456:fc1:c26d with SMTP id 5b1f17b1804b1-46201f8aa4bmr12363615e9.2.1758100246219;
        Wed, 17 Sep 2025 02:10:46 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:d458:6239:fdc1:d868])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45f32181a47sm37857465e9.1.2025.09.17.02.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 02:10:45 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,
  Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>,  Conor Dooley
 <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 0/2] clk: amlogic: add video-related clocks for S4 SoC
In-Reply-To: <91935087-0f0c-42ed-8ad6-f6312240413c@amlogic.com> (Chuan Liu's
	message of "Wed, 17 Sep 2025 10:02:19 +0800")
References: <20250916-add_video_clk-v5-0-e25293589601@amlogic.com>
	<1j348mj0sw.fsf@starbuckisacylon.baylibre.com>
	<66f130b4-88d7-46d2-9f66-9055896d445a@amlogic.com>
	<1jwm5yhgqz.fsf@starbuckisacylon.baylibre.com>
	<91935087-0f0c-42ed-8ad6-f6312240413c@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 17 Sep 2025 11:10:44 +0200
Message-ID: <1jqzw5h2az.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_021048_665229_0BD53201 
X-CRM114-Status: GOOD (  26.66  )
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

On Wed 17 Sep 2025 at 10:02, Chuan Liu <chuan.liu@amlogic.com> wrote:

> On 9/16/2025 5:46 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On Tue 16 Sep 2025 at 17:30, Chuan Liu <chuan.liu@amlogic.com> wrote:
>>
>>> Hi Jerome:
>>>
>>>
>>> On 9/16/2025 3:47 PM, Jerome Brunet wrote:
>>>> [ EXTERNAL EMAIL ]
>>>>
>>>> On Tue 16 Sep 2025 at 10:06, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:
>>>>
>>>>> This patch introduces new clock support for video processing components
>>>>> including the encoder, demodulator and CVBS interface modules.
>>>>>
>>>>> The related clocks have passed clk-measure verification.
>>>>>
>>>>> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
>>>>> ---
>>>>> Changes in v5:
>>>>> - Add Acked-by tags from Conor.
>>>>> - Remove unnecessary flags as suggested by Jerome.
>>>> The request was "in an another change" ? Why was this ignored ?
>>>
>>> Sorry to bother you. I'll drop the flags for 's4_cts_encl_sel' in this
>>> series and submit a separate patch later to remove CLK_SET_RATE_PARENT
>>> from enci/encp/cdac/hdmitx clk_muxes. Is that ok?
>> Why can't make it part of this series, as requested ?
>> It does not seems that hard to do.
>
>
> The topic of this patch series is "add video-related clocks," so I'm
> concerned that patches adding or removing flags for other clocks might
> be considered off-topic.

If that's the case, you could simply reply, stating your concerns
instead of ignoring a comment which does not suit you.

And yes, you should adapt the cover letter to explain what you are doing

>
> In the next revision of this series, I will include a separate patch
> to remove these flags and provide the appropriate commit message.
>

Please start with that.

>
>>
>> This is another unnecessary revision and the community will have to
>> review, because you ignored some feedback.
>>
>> As noted by Krzysztof, you really need to pay more attention to the time
>> and effort other are spending reviewing your work.
>
>
> I'm still a newcomer when it comes to upstreaming, and I'm not yet very
> familiar with the rules and processes.

That's just not true.

You have been doing that long enough and have been reminded time and time
again not to ignore feedback. Continue doing so and you'll be ignored too.

If you still feel "unfamiliar" with the rules and process, then you
should read them again:

https://docs.kernel.org/process/submitting-patches.html#respond-to-review-comments

> I apologize for any inconvenience
> this may have caused during this period, and I sincerely appreciate your
> pointing out any issues with my patches.
>
>
>>
>>>
>>>>> - Link to v4: https://lore.kernel.org/r/20250909-add_video_clk-v4-0-5e0c01d47aa8@amlogic.com
>>>>>
>>>>> Changes in v4:
>>>>> - Add Acked-by tags from Rob and Krzysztof.
>>>>> - Fix compilation errors.
>>>>> - Link to v3: https://lore.kernel.org/r/20250905-add_video_clk-v3-0-8304c91b8b94@amlogic.com
>>>>>
>>>>> Changes in v3:
>>>>> - Rebase with Jerome's latest code base.
>>>>> - Link to v2: https://lore.kernel.org/r/20250814-add_video_clk-v2-0-bb2b5a5f2904@amlogic.com
>>>>>
>>>>> Changes in v2:
>>>>> - Removed lcd_an clock tree (previously used in meson series but obsolete in
>>>>> newer chips).
>>>>> - Removed Rob's 'Acked-by' tag due to dt-binding changes (Is it necessary?).
>>>>> - Link to v1: https://lore.kernel.org/r/20250715-add_video_clk-v1-0-40e7f633f361@amlogic.com
>>>>>
>>>>> ---
>>>>> Chuan Liu (2):
>>>>>         dt-bindings: clock: add video clock indices for Amlogic S4 SoC
>>>>>         clk: amlogic: add video-related clocks for S4 SoC
>>>>>
>>>>>    drivers/clk/meson/s4-peripherals.c                 | 206 ++++++++++++++++++++-
>>>>>    .../clock/amlogic,s4-peripherals-clkc.h            |  11 ++
>>>>>    2 files changed, 213 insertions(+), 4 deletions(-)
>>>>> ---
>>>>> base-commit: 01f3a6d1d59b8e25a6de243b0d73075cf0415eaf
>>>>> change-id: 20250715-add_video_clk-dc38b5459018
>>>>>
>>>>> Best regards,
>>>> --
>>>> Jerome
>> --
>> Jerome

-- 
Jerome

