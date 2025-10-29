Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384A3CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 22:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LzhhJeyhuNotVzEFbkuilK+xDg5eMa2kqkHmG2gliAs=; b=5Cwq+1P27yq7sNsgtbhbjDO68u
	UQylMStYve/CJPvapoHVGuGskqYx9Gdi5poz2XeGG14piAcpn9WRBace087yXTJ+eXqnLEs6NyXFh
	8OiSxnrOLlci4jWSQA19s7QMZfLXzPd/XGQ43EPPaZs2EHPJTccICGg8Dhebw3PJC3NKCguWj60hq
	bwFzD3Va0cFJNxYmAJlDGvJUVc2MUUkYbfe4QedLigF5PvICjWNk3lV4Pxy/z+RmYxpUTAc3Pj13j
	ZxgptAFDnU0RQpC7DFBiHix2ZWRVX/SjemmnEpF0c1sIjmOCFrQSLcEMd8S+7FifjRF/ySSG2Yp2C
	koVkG+sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEEo6-000000038zG-1lk2;
	Wed, 29 Oct 2025 22:38:18 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEEo3-000000038yG-3HVL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 22:38:17 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-591c98ebe90so335496e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 15:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761777494; x=1762382294; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LzhhJeyhuNotVzEFbkuilK+xDg5eMa2kqkHmG2gliAs=;
        b=f/cIJeMI5G08uhCtfeakSnLRqWLS0Hc+WPcR3mDa3i385N9WopNi06lRA5eanmti1K
         0e/YfHLfp1vE66jp4hBbNMhxwf/v5IEKJmzyTtqOqN0Htk9kNlHNOTLaTl4EFEc0HVjI
         FfdGiGghRGvYSbG0P85Ip24mbg7rQrekXbIBaqLh3HL46YV5k95Ex/VryL7QxAPCnzJV
         skL+tCVIYM/C3kp0dx05WJJvjhYXKZA837NouTWPptaCe10euTaGYJEMpjUKEHs2Fdc+
         NSnbCcsYBJGSTG35+OX8ALWk+NJt31Q9xjs72Lr4ynTaFY29ChqmFK+wdj453OE8lJLN
         /SxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761777494; x=1762382294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LzhhJeyhuNotVzEFbkuilK+xDg5eMa2kqkHmG2gliAs=;
        b=Wo+j5TcEcK2OUX/y/Sp+9zyirlSIl/i/5JuG6sGbr9RwYSO7eX705RoV3xcdqofL8/
         7zGa7iiONpCLEyeGOU6H0N0C3WVHpLiZfsj++uj8Go5oL8JKu6hPCKM+KR9V68o/pn4k
         OCmIRpJ/c/KjTr7RAU4szXaBVXXeViuBpSscrGnOF2ZvykwAR1BtELb9zizuqJIj48BB
         +b/7WhTUgy51moS0xHbrctGFjn0TMK29Vq7oM+wGy3/ZTIoDPKkVaLRvsC3t1qAJX2aM
         JqzXXWzIxW9PagRcvurZFF7CX7Wp0jaYohNru4jM63+0yfsxmGwYnVQcy9iku9pIsJ2T
         B28A==
X-Forwarded-Encrypted: i=1; AJvYcCUzGpWMH7LrGoD5TMM8lzqVb3Exl5lPr85fvwez+4t+meXPYYuaVIgWodA58jvzwK48Y7XSU1gDSs0BUYkPWYFn@lists.infradead.org
X-Gm-Message-State: AOJu0YyGQ4QGdWMFbhcJfkbe/6oLmWc8IghMbzZD0D2nExYMkPeNVyfG
	hhS0vLm1uD5PCY350MXVtCQMEKSAsSG6+kSGat+Swl2AD+aridEvf/vOcMfwloXdIO/UNhTOEX0
	IrYvDyOuMrYeEpUpZSSQ2Z7YmgW9tQsEDfJSDxOgNaA==
X-Gm-Gg: ASbGncvkKlXVHYFPPniDZ7RGEFYYrVDvyLLZHV5czvG2nFca59EIaQ+yJKRms/fbZB0
	pUjVnVcqu3oCaXxc75eOSaNV0RNBbq6P+wFQMi4SNnibqO43KDvSfHUT7d/hjc/y+AFgyZOWQGF
	WL/P/SJs4lVVfXdKV5cx8KKe1mFPzinVhnhgOAv8Q7BFE2E90QsN3WC0wQANyBp77tHbuMASICg
	Km9c+Ri6/kuPQgg4Vq9Bh2cISK8y1QWMHq2vj4UDmAxa6dRf54XiDSaUjsqAVuXp2UWYfc=
X-Google-Smtp-Source: AGHT+IGSUDEU3GIah9012vj+4Pg6s5GLROpJXSNa8R5tFKJQLl26wMkX/AWwD8Tr3hAmRNfydWUkSQRxKrXdGT5PldQ=
X-Received: by 2002:a05:6512:3c96:b0:58b:8f:2cf3 with SMTP id
 2adb3069b0e04-594128696femr1551857e87.21.1761777493571; Wed, 29 Oct 2025
 15:38:13 -0700 (PDT)
MIME-Version: 1.0
References: <20251029014252.178-1-vulab@iscas.ac.cn>
In-Reply-To: <20251029014252.178-1-vulab@iscas.ac.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Oct 2025 23:38:01 +0100
X-Gm-Features: AWmQ_bkwwJG8Z6hmew0Xb94qZ2C3iHp-j72hqofQeN8YiL8UtJjm3k_2tYVG6MQ
Message-ID: <CACRpkdanWwXSAu4oH9LnnTJ0mxB+7sorUKj_juFrRebhdL1WKQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: stm32: fix hwspinlock resource leak in probe function
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: antonio.borneo@foss.st.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_153815_897003_21C7AEAF 
X-CRM114-Status: GOOD (  11.89  )
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

On Wed, Oct 29, 2025 at 2:43=E2=80=AFAM Haotian Zhang <vulab@iscas.ac.cn> w=
rote:

> In stm32_pctl_probe(), hwspin_lock_request_specific() is called to
> request a hwspinlock, but the acquired lock is not freed on multiple
> error paths after this call. This causes resource leakage when the
> function fails to initialize properly.
>
> Use devm_hwspin_lock_request_specific() instead of
> hwspin_lock_request_specific() to automatically manage the hwspinlock
> resource lifecycle.
>
> Fixes: 97cfb6cd34f2 ("pinctrl: stm32: protect configuration registers wit=
h a hwspinlock")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

Patch applied!

Yours,
Linus Walleij

