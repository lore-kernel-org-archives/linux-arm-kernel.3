Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84632CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hImylEF8kRxc0pZCmefapOdNIdI9K4EzdImQ0P7qUyc=; b=TmJkwGbduzH2nP2C5U+G9sl44K
	NyywppZEV7xDZ3pIPxGiKlPYUHNz0Zv5+aK1IQRFjUtpBonXDWso7x/H379ZSvT/zXaQUH1LwIr8i
	lHxff5JelROiQUZUvpQI8oib5d5mGMR0j6B8fvShvJMAS56zAURW5wR1nnyZCBZMtFAagluFYn5Qi
	ABA8qAcJ88pGUWnwtonzaJTLt7G749+ViGhHNlBHbuqB9JJtEXdKZsY3KzJsnKhk2A9lKkPkRzjv4
	oUN82tQEmmrEnS7KeQPhjbRUx+Hx0Q59q8QUh8hqCfnH8vVkFk2NwA6puvXDB7H1oQ4VfvyF4SIcY
	I6ZzyXFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXUj-00000002Jg1-2Ecg;
	Fri, 05 Sep 2025 14:32:53 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSZs-00000000gGy-3Krl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 09:17:54 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-24c786130feso18060085ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 02:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757063871; x=1757668671; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hImylEF8kRxc0pZCmefapOdNIdI9K4EzdImQ0P7qUyc=;
        b=4QHYD7SbSzSuZM1vXuaYL5Fja+x0UQGPUx4sCiGdGr6tKbC1748O+L8z+WX/yERk2P
         eLxSsoK84fYG2I612NqsvFKm26pJak7yI82+wpFoSwRJmk7I/e7/+pOZBqE7jqcj9e+B
         JJDfUy+RHc4g3LdykVSFvvip7Wd5qcOglDJS5pbrmGrYmpZsHRMU+lEmxLLg/42STSwc
         F7VPGOQifFWGYtKVd7PFQ0pB6q+gk0WJ1ipLrO4vvmW31jUTXWvCIAgyCJHxarJ8M34x
         KbHhzzB6KcR0TmJyVxP1wTMqiwkKkpXPp/NIerU2v2/J/jGvLORcbfZ9uIrDZQ03me5p
         zfzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757063871; x=1757668671;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hImylEF8kRxc0pZCmefapOdNIdI9K4EzdImQ0P7qUyc=;
        b=byvbzz0Ynp0qGO9u15JMNwfCphjM8+K4S0tNMX7B5j1DcaIYIgDyBaV7YN2QxshOu+
         5AYk723xe0FM0ZKaxwdC/eK5HUBZzrwBEB/i6xwgAcrhqe+xjgJxeZVvp2S1fBJG2ZIv
         dHi1mSZqhRjf5Pg/tXSXri1BJE5nLiIgNxiTY5FS9B8NnFvYOSTo7I7Qo0y2YTkU8hOh
         dMXKDINabRP8MmkEBQnzeBN3o1rC8EkFJROoSDw8XlGzfzgqWa9oWpKTqXJrO95MedPp
         3BBtqx0IHVlnhbKihc3tCcw4zEpvk1kmEmIoteYoCn6GdtnkS2zEowMEiBqnHSsP8bW1
         LGow==
X-Forwarded-Encrypted: i=1; AJvYcCVxc9YMkFBVxM1+nWLZhvenlOgLq7KJcbw4UToSZOGZoAoTKxG8QwBnBY7yq3OcdsQTzLx+oMlnOxlciFL7DKer@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhcb4uBi/7W6sPFDxDGi9WIYhpGtyZtFo0AkUuxKBnHnwl8bCj
	X+CXbGtEgdvCnU9ZgNJRnxR1HUpZC4CpCB69XMcu2mSZNit6R2S2DThp7bi/5XHS92S349IwVZi
	LEcMOi95t8fDKYWPJSqoW2EJ03V64WW6TKhMwhUtL
X-Gm-Gg: ASbGncv44hBwB4NMveiARwp5CgXlx8SVCV35Uorn+EgNwAM2KXNbJH2+8naYP2iDxIG
	3L0/BUJmoaAqzpYLX1AyfHoGfoZC6HkBepHqudbPVSVb6GBIrzdNMkVF1TRySl8bo6L8YrKf9hv
	5dikU8dOQ9iCkxvHZMWm15bf4y66GqWqkeFnvwevSpJpjUYCXu1AGhbNaCSCpm4MTtf0yjEuM+7
	gtll3jdci6qml7sGyV71b7o5wa0FLIoFNOLnuig729NOfnMQS7M3uU3wg==
X-Google-Smtp-Source: AGHT+IF9S6iUUusneiZYRAF8ubXHonr/3eNJ3dxl0xbw7JyDRWMcPsctZ7caRsOI3KB+wShmBqhQXJYDFiofBVvADxw=
X-Received: by 2002:a17:903:3d0f:b0:24c:c8d1:2bec with SMTP id
 d9443c01a7336-24cc8d12d26mr73181375ad.40.1757063871035; Fri, 05 Sep 2025
 02:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250801092720.1845282-1-verhaegen@google.com>
 <20250801092720.1845282-3-verhaegen@google.com> <aJGM2zXS6hOLDFm1@vaman>
 <87h5ym1f75.wl-tiwai@suse.de> <aKMzGRzeRqkOwTNS@opensource.cirrus.com>
 <aKQGuPgwXE-Unzeq@vaman> <87bjo96t2k.wl-tiwai@suse.de>
In-Reply-To: <87bjo96t2k.wl-tiwai@suse.de>
From: George Verhaegen <verhaegen@google.com>
Date: Fri, 5 Sep 2025 10:17:24 +0100
X-Gm-Features: Ac12FXyMMz2kHiEopHVWkiVekeij32ZuBn5pZ91dcPOnuZoD_YGrtaq5a00yJT4
Message-ID: <CAAntYmLGiqfZDKi2ndB7vk1GGZ7=FdozFvUFtMsKhVf0AxdsCw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] ALSA: compress_offload: Add SNDRV_COMPRESS_TSTAMP64
 ioctl
To: Takashi Iwai <tiwai@suse.de>
Cc: Vinod Koul <vkoul@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Cezary Rojewski <cezary.rojewski@intel.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Srinivas Kandagatla <srini@kernel.org>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	kernel-team@android.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-arm-msm@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-arm-kernel@lists.infradead.org, Miller Liang <millerliang@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_021752_831581_85A7D5AA 
X-CRM114-Status: UNSURE (   8.23  )
X-CRM114-Notice: Please train this message.
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

On Thu, 21 Aug 2025 at 08:18, Takashi Iwai <tiwai@suse.de> wrote:
> OK, Joris, could you submit v5 with correction of what Vinod
> suggested in reviews?

Submitted v5 with revert of the alignment change. I think that was the
only remaining open item.

Thanks,
  George (Joris)

