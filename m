Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC1BD1BDE5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 19:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yD3GH1J0iNlguoAQJzDGR4fLjLQcEa8IFkCoKmA2t3Y=; b=GJlx0oTHakgcrWPyy/4eufVhA3
	p9is/Hpp25BfueSAoxMnnmsN7Z+xbNXZ9fVlMAdXDSHUr6YyMJ1WL0ntGU5I0tNuAdI7qBtfT6mFQ
	mCxZUl3/6ptgGtFqCuofPBydelpRQ7pzQsyi3s8n6IG0ovMpJvtUkWaI4l34G4yL8Z+eYmG6irz4F
	UqaebGJej2hYkIIZap1zHNSkUjdr9IgzQTcndB3E7Ce7F7AIfXN9DfbmBxXC3HJfP3g823taLnq0+
	Ye1VGFgVajNnZ+4TL4YGHHhA/xvT9ipE5UUj20wdj9I8IuM/46nyJO9hYC3VkPTkx6nk7GQn1CIFl
	bogj3Ldg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t82gP-0000000Et9Q-1RgE;
	Mon, 04 Nov 2024 19:24:13 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t82UK-0000000Ere8-1Htu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 19:11:45 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-720be27db74so3023308b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 11:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730747503; x=1731352303; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yD3GH1J0iNlguoAQJzDGR4fLjLQcEa8IFkCoKmA2t3Y=;
        b=EC5u6zTPIC8KvpGdHe437/LsW8EscBbMs6H5XFQYg27skX7ZHFM/RrVnsXaMxtbYUO
         iCk9s3bXHh+ZJDh0Xw63ynJVqk3GdDx6ksbQIqoM3HfajTcb7qVwPy/E9TSifswPSk1H
         WItwbf/+TxtIlVRccXUysi/So7eqMBURvEppClW7ErIbDmYUK7HafqxJD8IxA/IOAiRC
         c9U6dTBlKCrO0r1I8eOuZCA1cFEflGZxdRhau+RrsXw7n0KH8IxMkaU6oZOE6GnmmaQH
         Ny6F7owGLKzzWUuJI/oK77rjyY/AuavuyJ/qEhtp7+os+oZJHcDPMTiIMIEFMj2U1Jnb
         HEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730747503; x=1731352303;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yD3GH1J0iNlguoAQJzDGR4fLjLQcEa8IFkCoKmA2t3Y=;
        b=jMMTwKeuVsmDxMjHYCcfWgITaj9VIGUlcn4ljm2FrU8YDkHkeAp/oe+T6aAeMdh0DG
         QbntFSRnFYL6SDxc1XCGOAyTp7Oy1POUS/5JPRNwMMEhIs1X4wwT8KhLnrbJenmWI0gN
         HIrtGV+9OsnTj/Z0JNO2YrgNpVUUr6evA2x78VhUNx0+/5/ACOwtIIcLalKR+/MfYnW3
         dw5Qxd/Bp5pYT3qCTrnWNX8EVM85S7gpSzXp9gA4LAcxehBxNNgp1nyZLtgZNcKLNxdF
         t0wcmXtCXSFp/kUuzdbUgovml/VtROg2oOu2cecuwXT59LGvf+7NZ9ZHmFU1EblJJYF0
         paXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPCo1JZe1eX/7/Os8kYYFFeZt6dlkNPcWHLt4+6ZCjpSqBVlusct80nSkbc70s5RzNJWiV9YTK1V3NVnNbvO1u@lists.infradead.org
X-Gm-Message-State: AOJu0YyzIZwG8Y5KHpCs1cJ17e7fDfmM3LhGlc8Yp5hURGIpCfcd+VfJ
	FpUq+LUdU8hXQh2lNg7GT5k9lSBJcz2FK+hVDH7bb9zNaXDlm3iJZOQL5daXpF8=
X-Google-Smtp-Source: AGHT+IGqCQyEM930jC+c3qeymfKxAzWzWDIDt/8CIo9XGMeeXcHgVl+iFmqzHFj25u//wA35k/KmZQ==
X-Received: by 2002:a05:6a00:2150:b0:71e:4fb7:3a87 with SMTP id d2e1a72fcca58-720c983b763mr18191351b3a.13.1730747502942;
        Mon, 04 Nov 2024 11:11:42 -0800 (PST)
Received: from localhost ([97.126.177.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc20e4c2sm8131771b3a.91.2024.11.04.11.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 11:11:42 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Nishanth Menon <nm@ti.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org, Vibhore
 Vardhan <vibhore@ti.com>, Dhruva Gole <d-gole@ti.com>, Akashdeep Kaur
 <a-kaur@ti.com>, Sebin Francis <sebin.francis@ti.com>, Markus
 Schneider-Pargmann <msp@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] pmdomain: ti_sci: collect and send low-power
 mode constraints
In-Reply-To: <20241101203248.oxddn7yea3us5nth@tables>
References: <20240906-lpm-v6-10-constraints-pmdomain-v4-0-4055557fafbc@baylibre.com>
 <173029317079.2440963.17313738472826934777.b4-ty@ti.com>
 <CAPDyKFptHq6xkKSAmeHsEuhBoEhzvudcMf2+nG08MFPwnMi+ew@mail.gmail.com>
 <7hv7x9qsvt.fsf@baylibre.com>
 <CAPDyKFpdgg+kM_Ot5GPTpMUtjmBF-pUhCeRpVb=j852_7qm=3A@mail.gmail.com>
 <20241101144445.56ejnuoxshqwns37@boots> <7hwmhnnf0f.fsf@baylibre.com>
 <20241101203248.oxddn7yea3us5nth@tables>
Date: Mon, 04 Nov 2024 11:11:42 -0800
Message-ID: <7h34k6olu9.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_111144_369435_3A6BF7F9 
X-CRM114-Status: GOOD (  27.82  )
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

Nishanth Menon <nm@ti.com> writes:

> On 08:35-20241101, Kevin Hilman wrote:
>> Nishanth Menon <nm@ti.com> writes:
>> 
>> > On 11:11-20241031, Ulf Hansson wrote:
>> >> On Wed, 30 Oct 2024 at 20:43, Kevin Hilman <khilman@baylibre.com> wrote:
>> >> >
>> >> > Ulf Hansson <ulf.hansson@linaro.org> writes:
>> >> >
>> >> > > On Wed, 30 Oct 2024 at 14:01, Nishanth Menon <nm@ti.com> wrote:
>> >> > >>
>> >> > >> Hi Kevin Hilman,
>> >> > >>
>> >> > >> On Fri, 06 Sep 2024 09:14:48 -0700, Kevin Hilman wrote:
>> >> > >> > The latest (10.x) version of the firmware for the PM co-processor (aka
>> >> > >> > device manager, or DM) adds support for a "managed" mode, where the DM
>> >> > >> > firmware will select the specific low power state which is entered
>> >> > >> > when Linux requests a system-wide suspend.
>> >> > >> >
>> >> > >> > In this mode, the DM will always attempt the deepest low-power state
>> >> > >> > available for the SoC.
>> >> > >> >
>> >> > >> > [...]
>> >> > >>
>> >> > >> I have applied the following to branch ti-drivers-soc-next on [1].
>> >> > >> Thank you!
>> >> > >>
>> >> > >> Ulf, based on your ack[2], I have assumed that you want me to pick
>> >> > >> this series up. Let me know if that is not the case and I can drop the
>> >> > >> series.
>> >> > >
>> >> > > Well, that was a while ago. The reason was because there was a
>> >> > > dependency to another series [2], when this was posted.
>> >> > >
>> >> > > If that's not the case anymore, I think it's better to funnel this via
>> >> > > my pmdomain tree. Please let me know how to proceed.
>> >> >
>> >> > The build-time dependency on [2] still exists, and since that was just
>> >> > queued up by Nishanth, I think this series should (still) go along with
>> >> > it to keep things simple.
>> >> >
>> >> > Kevin
>> >> 
>> >> Right, that makes perfect sense to me too. If we discover conflicts,
>> >> let's deal with them then.
>> >
>> >
>> > oops.. I missed this response. OK, I will let things be.
>> >
>> 
>> Oops, 0day bot found a build error in linux-next when CONFIG_PM_SLEEP is
>> not defined[1].  Need to respin to fix this.
>> 
>> v5 coming right up....
>> 
>> Kevin
>> 
>> [1] https://lore.kernel.org/all/CA+G9fYtioQ22nVr9m22+qyMqUNRsGdA=cFw_j1OUv=x8Pcs-bw@mail.gmail.com/
>
> Kevin,
>
> Unfortunately, I have chosen to drop the series. We are too late in
> the window to take the updated series and wait for new regression
> reports. On the flip side, this will clean up the flow for Ulf to take
> your V5 since the dependent series should ideally hit rc1 by then.
>
> Thanks for addressing the report fast.

OK, thanks Nishanth,

I'll work this series through Ulf's pmdomain tree for the next merge
window.

Kevin

