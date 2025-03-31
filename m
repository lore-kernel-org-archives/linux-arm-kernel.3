Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77885C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 23:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e04/jOZEpgcg6Qfa0s1PaOutVdlD0Cl29sqV9y8ymK4=; b=wLNhgVOfylAJcqsHz6kn/NgAqA
	KAyFW6WPzPjk5M8z5oi/yVM6mF8LS41aZWmnJC5ieMYv3gT0WfcqtG1zzx665b5XQYzXhpdFfBiUN
	fIe7FOhjWQTN4HFOARTnuNKFaaidnt57qkwkN+B0lCcmNwk0cDwnS0PemFsIw58whWCx/sjt7jeh0
	OeaRMzFEpMMtVRR1Nhm9HQM8EOPsbxJIKfray24qhaiXiq7ddufipFFCFWEAgAMhslr1OpHwdAhKf
	nBzLjDT70xIMK3Nh074F4z1zZ7pTCib+z30FdQ0bmtsfktzXM/awsW5kCazQu5QYirK/EAjDuaeWS
	HnrGgfvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzOqR-00000001bbq-2FXi;
	Mon, 31 Mar 2025 23:47:07 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzOoe-00000001bUa-40B0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 23:45:18 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5499c5d9691so5269669e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 16:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743464715; x=1744069515; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e04/jOZEpgcg6Qfa0s1PaOutVdlD0Cl29sqV9y8ymK4=;
        b=bW61dnqoxsA89o/hTOYLxSIouehoo+em8tv39/YHdKXNSJgWM1g3sGzEWsTR/SP9UV
         QBfKRGpDaB5P1upbNad3ym08/HiexiPleh8hLdJfdMPtIMKIJh3UVFDTlDW0BB0/wt+X
         a53xhI13I/zBUy5UWsdF6k9Abrgdn9ViUuu4nBNdWhnBmb9tI9HjnB030KhzjGb80jcE
         IVDEeb1JwDEM9QPhQUvktwyBbDw+t1hEeKlmvnrit7Mm+AWkndu9BzfHgAucHs3h9nV8
         Aqp3sN9BhaUIYHwZVNbHYzb9mgkTg0busRmgP7YAyT5JFsKF/bbu9bXruEe92Np4HRPz
         dfmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743464715; x=1744069515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e04/jOZEpgcg6Qfa0s1PaOutVdlD0Cl29sqV9y8ymK4=;
        b=ueMaHl/WcdjEiY5g/yFArqUIBRlPoKBEdPNSRGtkoHERIe8AyLrvSOMK0lgcLfXnje
         QHoiVy0QUc79e2nso5OvT8diLb3MWh9NI1WwtyQEK7t7WobkVq3Elc+2Miy4RAnL+qab
         dUSRpXEdlrrUf9xvHkBwwMXO7TEkfr1OflqiWqkVGcPpgVrkZoASvLjR7h1a98pnvKUm
         6hNpx1b2HO6iI04+v0BDS8orBdLP//km+ZDYwFPcrw71VixLmvOf6cqtK6TC44vApj/r
         HkWPAjWvOqHEmOy+wQv3EpmyGmwibgwUJsvZmbLoB8eEJxUg5GgGaCXNPmS9kRvYOz72
         /WGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHCtTDG92SDcOU6QDex5Juk/DPCgBNUf6sRq9iCfzDKADtkJZhCP5F2la4hMnl3GOq5z8vZTz+XccYMCLoHQve@lists.infradead.org
X-Gm-Message-State: AOJu0Yzih71UOxIhito3EZX7qQ+5Z6xtfqg4g2kLC1amq/TR9uBJB9zu
	+pLZqTeB5iu6hpeSD2PKI/R7SCjoImReGG1nfZvZEq67w7zu8/QZJiVB5faHyxVDLtzi9l9TEUj
	gM+Nu95BUHBs3V6lzNO1OjsQVF19GvuaVN+g=
X-Gm-Gg: ASbGncuslFCh4KWYWqiu2dlwn/zKUZZseEAa4RPa1EdcHDUSPi0tkHZVnoyg8XvkYRZ
	d+SayGOhuFIdSdTSoAH1yUQdNHBjFx5m+uSU+4f6k6SdOna1TjB03vzKDAezNYPHzqaZSYKNlM/
	LWpuIyqROz3P1LDXyBzbOXoYKxZED+yHEh2nthq6dtZ/+ZxCn78O2XxVw=
X-Google-Smtp-Source: AGHT+IGKxk3GQ1L9qdBB81JDCx4Bq2Dj2b06TXN+b9tb6Ea14RgDQquGhJcn7FWqUTKnzxE9oIWAc1dXzRqRgDpEaRk=
X-Received: by 2002:a05:6512:3087:b0:545:532:fd2f with SMTP id
 2adb3069b0e04-54b10dc4647mr3518759e87.12.1743464714691; Mon, 31 Mar 2025
 16:45:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250331230034.806124-1-willmcvicker@google.com> <20250331230034.806124-4-willmcvicker@google.com>
In-Reply-To: <20250331230034.806124-4-willmcvicker@google.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 31 Mar 2025 16:45:02 -0700
X-Gm-Features: AQ5f1Jp34FTtnvs1g4RVHb7nLo-iWvkEtBdosqwvf4UXMVf7403MXs4PKlQvGmM
Message-ID: <CANDhNCqNqXfGgvo8vNof1qi3E3jejk5KBD=oedZp2_p8RKZdjw@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] clocksource/drivers/exynos_mct: Set local timer
 interrupts as percpu
To: Will McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Hosung Kim <hosung0.kim@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_164516_994758_4C3DC976 
X-CRM114-Status: GOOD (  11.66  )
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

On Mon, Mar 31, 2025 at 4:00=E2=80=AFPM 'Will McVicker' via kernel-team
<kernel-team@android.com> wrote:
>
> From: Hosung Kim <hosung0.kim@samsung.com>
>
> The MCT local timers can be used as a per-cpu event timer. To prevent

Can be used, or are used?  If it's an option, is this change important
in both cases?

> the timer interrupts from migrating to other CPUs, set the flag
> IRQF_PERCPU.

Might be work expanding this a bit to clarify why the interrupts
migrating to other cpus is undesired.

> Signed-off-by: Hosung Kim <hosung0.kim@samsung.com>
> [Original commit from https://android.googlesource.com/kernel/gs/+/03267f=
ad19f093bac979ca78309483e9eb3a8d16]
> Signed-off-by: Will McVicker <willmcvicker@google.com>

thanks!
-john

