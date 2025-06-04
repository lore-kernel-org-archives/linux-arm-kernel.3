Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3374DC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 12:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yaZTpWyg0hpKHYyjrUj3+OP2gwR0EFDPrHBmPT8RlVM=; b=OY4UmiUKQsVrzB4sqBcstE+HM5
	Vo7eacibsV8UIFO9OotdKM93XAyva8RsrQ0Jsv126aqTMjRiz2ACZoQcxOghxQY2cwVR+qeQAMd+V
	8EjJrAA7HBglMnrYHVHPO1MBC2Srk2O88zZzz4FVt5/K8qSPzXElyI5SCj2KO49qth+Bo2Au60qAd
	zBAA/Brt+q8/WntYRVQjJY6moKrVEdapzgZrSa7lGwvoWu0f4wkEcx0YNCKhXUlNKj0R3baLoLmTM
	PasijlJbKEPBA2A4Xqob4i3iC7AS05kDf6XFySaq1UAvNqk7Fo35JPFrEOEUlJGG/5BB56C594/j1
	juLwgofA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMn9w-0000000DK2E-2f16;
	Wed, 04 Jun 2025 12:23:56 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMn7o-0000000DJiL-3zpo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 12:21:46 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-4a43cbc1ab0so77950391cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 05:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1749039703; x=1749644503; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yaZTpWyg0hpKHYyjrUj3+OP2gwR0EFDPrHBmPT8RlVM=;
        b=QNi1j0MFG+BjmwpbxXEkK8oTEbNwciyEcJPELgh2KTLGXoNdfeuPWGiP/XAaWYCl8s
         G0uVcf5TppCujgpPS4UOvvQGs5pOh/bxbMA7yquAKUARJK/3eblt4nc+EEvo6/qkaIm9
         jg+Xg8bnHFplQm4501nKmlEjvxEf/7KXi1XC1h46/vsfuadkggwHLjb++H/tVfdICQMa
         Ra3ck5wv11OBU3OjtWFLPsAjmvJvzaUH4ckwz795YZlJG8lkSG2G6WNk4wk8j6c94f24
         1SI9Q5C3NlUCHX45CH68lOJa5hR7DA5kgPhVAhjvFgP+WmAMI5slCiFkGBeOP3GvRWTV
         bQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749039703; x=1749644503;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yaZTpWyg0hpKHYyjrUj3+OP2gwR0EFDPrHBmPT8RlVM=;
        b=jxHtWU3EzFLidB1WxOqxU/7Y3nK+bxH2nizTgti7u8ptpAyQkeK2oldXwLWQxG6/GQ
         FNpXZ2NM25yDoEVwnKUPGsvxe/wL7oNM170YrhW+A0duq3gnuuPa/g+YTHGrH29H83hZ
         ymwr0UpIbTo5y3dWghqIT39YhRDdzEOmmzhe2WpiCaMt/Yd2rAQpP/PY8mboLl7Wfn6Y
         AqzItQ7p4LAR4ZbfQ5Kqk3Y9FydymX+n7rJRm67nTEzfGI83L6WrpWDsT5mvDeluzsGw
         EHNLbOrEbTS56zgBayHqftZRA2OjGPDbS8ksbVhcUGX+OohCMByRtb2m85hZJCodDojV
         baTw==
X-Forwarded-Encrypted: i=1; AJvYcCWG3Tqo9+aJwcnbAr5rp3BqQdgGQTUdcLJo1KnMRlUqz1lvsE9+IDXzNnIG26d2l2hUKNcCYGOzvDh1OliI8TGe@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu0xTTUQDxJIdcVO0go7prr6gVBi+Bl2TGUmFR7/PiQkrFxN5u
	0r8+w3+Gv8uN0k3MmRK8eEa83XB5vAzZ2CcF2ms5Y3XENr/CZ7Uc7mDYFVSCSbIKiqF12HUhb+3
	UeOHKJ/OpjErILB5zQKJO4tmnnBZOiqmFLS+UPBu1aA==
X-Gm-Gg: ASbGncvQ4o+5kfVl1L5c3ZM6CiuGh2YZ7xFl3/gGX2aTIZbW6shlQ9d1sxVF3Q6M1m0
	KBVJqEaFgyZvPlxL8jpDpLhp6UkCzUUwdgshMbfYwiV6n3TJZ04bgo5Nx+iMOEei6oTSFFRR/7X
	Z0iiy5dMgzdeGPwDiiTMxdFrJEZElmcQ==
X-Google-Smtp-Source: AGHT+IGBhb9oN9Dnm4FiGYp7zAjk8KUthNG2jfK6LDnEP2PSQ1B7bbxENdlAigbtFAXPzwkkLJkzP6CGB7NZEJFpiUw=
X-Received: by 2002:a05:622a:5806:b0:4a4:2fad:7cdd with SMTP id
 d75a77b69052e-4a5a585f07cmr36560661cf.24.1749039703440; Wed, 04 Jun 2025
 05:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250604090054.7070-1-mail@etehtsea.me>
In-Reply-To: <20250604090054.7070-1-mail@etehtsea.me>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 4 Jun 2025 13:21:31 +0100
X-Gm-Features: AX0GCFuX5NY6Hf5wXDs-Pk8QnTYrnxwjGyh7lfIG_jr6I0hdBynp5Y1APmOGjzA
Message-ID: <CAPj87rMU9qcdEmAVuH7E7ENkHCn5zveKA-Sk2bvCB=6BwxR4Ug@mail.gmail.com>
Subject: Re: [PATCH V5 RESEND] drm/rockchip: Reject AFBC for res >2560 on rk3399
To: Konstantin Shabanov <mail@etehtsea.me>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dan Callaghan <djc@djc.id.au>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_052145_106912_A3F94FA5 
X-CRM114-Status: UNSURE (   8.11  )
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

On Wed, 4 Jun 2025 at 10:01, Konstantin Shabanov <mail@etehtsea.me> wrote:
> As it isn't supported by rk3399. From the datasheet[1]
> ("1.2.10 Video IN/OUT", "Display Interface", p. 17):
>
>   Support AFBC function co-operation with GPU
>     * support 2560x1600 UI
>
> Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
> Reported-by: Dan Callaghan <djc@djc.id.au>
> Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/7968

Acked-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel

