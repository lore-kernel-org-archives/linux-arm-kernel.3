Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CB2E9413E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 09:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9CSA4RsITRmIPzLrBNLCxMgAc0tHKBMj5y/0Ba5xFWg=; b=Az7pvhT7YgEpDJOc4p8HCgdA8E
	+9Bs5itii9NGIUezto2ETZRHpdqPGo/vhnbp3Feyz208kuaRpFLFsE8vOP6MI7ItHlikGgO5LebUs
	yK0NlRBr95IdLVDIM4r812pTfbz3IRtIrdzQb6lZ2jr8cCyibXrkyt3pMFz6GmTrzTKO6oRD2fJ2D
	keu2rZhRa3TwxHUVL+catic+81aF67FvgLFnbuAx+VwAps8qv8lPsEiNhu+SHaFCZc2MGsNNlk8pv
	npcrZWCvYSlNpr9Y1AnPB3vdz1SDCeobb1SjBvKjOixL9OAWlFUph3tTuDxOF1XWkBS7Pfb5v8CU6
	t9se4hEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaWSs-00000004gdi-15TC;
	Tue, 30 Dec 2025 09:56:30 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaWSp-00000004gdM-43TV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 09:56:29 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-59581e32163so11360071e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 01:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767088585; x=1767693385; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CSA4RsITRmIPzLrBNLCxMgAc0tHKBMj5y/0Ba5xFWg=;
        b=by3TvZj1x7DYIQjpdvmh2qqXLwFL8jBwkr1jx7iURCWvD+Jtj/D9JMnOFdDazdrI27
         zzZrtsh7VKMy3NgaakZsMITSc1fbB4rQ5KYnUqPMl+ILQnGNF/Ifxogy/yN+K6IsVXBa
         L0lqR/zuIHWpoacGzTL6tbPEj3p4jtvTbCgLb0jjy8U2h/bq4Fu2EFH13ZYRd0EMlszn
         cWPX8xS3OSBAtjg8t9UmtDNmszvcwVLPQvthxox2DjZ/hDyExnYini7kG12w7jOnmhMc
         mfJlMGN7VL0L6PUrmsJMRU6J6HI3pun1e4zR9Ab3cl6HxdbW6GoFSz1VHLkj6GkPaHGs
         Igdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767088585; x=1767693385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9CSA4RsITRmIPzLrBNLCxMgAc0tHKBMj5y/0Ba5xFWg=;
        b=vE7ZRcyBv+kJycQoevByl4noY/1HOfUK9X1Tn0aIFiMOfBV7DL8Y9JAdzcucZ2nD95
         j7oS963T4ASGY59l497J55MNFYvX+TIvnCEYycBvQEM3RC3cgDgHdc8EAe8PoHSHSEy3
         ZIf2m/uQu0fEHOo/awah7+52j2Nu5IHfdYlm5+ZJZzfEG0XVh0S+WPGhDyekdUufsZOd
         8vZyusQZmRGLSNc/zCrxbqNjjeP/liqExUCZOYxhzRKgh9DvZKftc9QpqKRmX2aPJ++f
         FSAQYmxvROX+QFRV6j0fMzyHG69TbnWdcqpFmPpxU7bYBWSKfmNQz8b4XHZAiY8jCH/B
         YkVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWMMIUJfzHA1Gi/CYYJur0XK2jeoP9cFSbbvNjqCMrpdQnXuhIWt8ZopuKUsbo7+3/ZmmPg7RENni+k301mnTJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzyZ1zwQt33xT1oHlLtjHVX4yOtzg3ZUA4PVPFxP+6p/u+yzX/B
	GRQ6l2gvzisGPVEcGDGa8QMhKXOlaTmOGmnGTl/irdpqZFH6eRBwOLcTLUVLQ8jyIsvhKaE7YjX
	v8RlMZjCZlIEEsbSr2mA7QpE4WBafS21R9E71lDfYZQ==
X-Gm-Gg: AY/fxX4w2rvpr3T/Y/9GzPEDSYvECj80Y/faDytA6s9ElMHoz8SpVg7tta8NyFYLDtA
	87DG7wbojdDaWmoLfal3mbmD2zcJxNgH8XgzKGtK0PEtdfgzdhUPa3QlZyDyVIUbVyJx74qCKoU
	2qTspEDhp4EpFUglehS/MmZEHvLjEY2AWEwQlXqmpDPpXZOBP12xSzqFaYDnucdKbNVHyf7tNNv
	H2nF1QxngALVOFLPg2yx3C9Upb8XGYHo5FiLnNK97vJI6IrNCLlJzasbSpJYFkKA2MwBwtxiDYk
	+PMR9fJ/+TShsBs6NpazcAYCOjJq
X-Google-Smtp-Source: AGHT+IGF2+DUuPOWMyxl/m/YE1J+MpsN9z3qB0Mfg4V4PK/uMaSMEjg5JdfAVQd/YzIJO09H45JgrMZiuh+pgS8W7s0=
X-Received: by 2002:a05:6512:110a:b0:595:909d:1af6 with SMTP id
 2adb3069b0e04-59a17d579dcmr10690623e87.28.1767088585063; Tue, 30 Dec 2025
 01:56:25 -0800 (PST)
MIME-Version: 1.0
References: <20251104112923.143408-1-marco.crivellari@suse.com>
 <CAAofZF4OJi5eEfjhE12RWi6wDU+A9Rghsd2721SxZR4AC08sYg@mail.gmail.com> <CAAQKjZPVi1KHuS4p6G2uAeKMAg=PEbECj7DHW7OYNYLG-S9hmQ@mail.gmail.com>
In-Reply-To: <CAAQKjZPVi1KHuS4p6G2uAeKMAg=PEbECj7DHW7OYNYLG-S9hmQ@mail.gmail.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 30 Dec 2025 10:56:13 +0100
X-Gm-Features: AQt7F2oh3vqm2C9AigTf7qyt5vRvEM0_ckvr_DiAVWkRHeGhyvYiTBn7mc558-8
Message-ID: <CAAofZF5Fi7x0JyyNm=pSh9H=qp7qCH1xawB5Ad6+=-xzwre+Ew@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: hdmi: replace use of system_wq with system_percpu_wq
To: Inki Dae <daeinki@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_015628_012995_76BB90E6 
X-CRM114-Status: UNSURE (   7.95  )
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

On Tue, Dec 30, 2025 at 6:48=E2=80=AFAM Inki Dae <daeinki@gmail.com> wrote:
>
> Hi,
>
> Sorry for late reply. Merged.

Hi,

No problem, thank you!

--=20

Marco Crivellari

L3 Support Engineer

