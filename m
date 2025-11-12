Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AF7CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 12:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ovXYBvf9BeaM5Jrvkdgwh1YmZinox/U6c6KG8zcWhac=; b=pUH5FRCpp7oSmLItCi/BD4uqtX
	eRWbmnJKxbbINUGqnGq5zpAWkCDPI41S2NkVOxbYttFWV8IDC5f2X7kjaF47BKSf7QgNdTREklgrE
	md3M1wduZd8KyZqWoc1xAoIcY01SyS3KGis1ZSmC7L0dBBPoofN1/RxHakWpkodIMU0myaIRDmga2
	T9GFQRfDpEGneMKn3+LQNl54apREOusfKmYBvjxM5sTkdsQZwnuPp1ANbNlOON+GQjG1H4l4WxPcP
	TpGN35fmIyQ3AjCC+eT8D3yxi7s24tt1CA6PHxdakicCbbnfK79EYIInTQxXZHpPBg+jxGdBD7PqF
	kzQ+OMkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJADg-00000008nOg-2gQ0;
	Wed, 12 Nov 2025 12:45:04 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJADd-00000008nNP-3ODO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 12:45:03 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-59431f57bf6so713872e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 04:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762951500; x=1763556300; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ovXYBvf9BeaM5Jrvkdgwh1YmZinox/U6c6KG8zcWhac=;
        b=FjDPJxrXsZBqRrA1vUvg3vTIsB0jCe9d9Km2hCY5VDGw5IOWl8SA8PJDOla8VzOFHG
         s7KbD+lDNn8nFu2MO4hMC4qvoIckOsCu87lUvBLyvFJYM8OcS95wBk+SakvPi6Sr68VL
         49tonjMadCIHfnDpU28DEDpjVrILK/II9CQIekvgW8Gq4d+QvuhFfhR083y191VRLB+k
         LRNzN7wKKePV4cp3E85rU4UATiJBwZfpEyFBzRnF5WPMlb3zWFt2yaUV2suPkMJoLkUd
         ENYLxEiyrrXDULopJDCfHl0i1kGdIYeEJ/ydRiE4+0hOdbhSEWNWYIQR6j9ftYiHVKvK
         kauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762951500; x=1763556300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ovXYBvf9BeaM5Jrvkdgwh1YmZinox/U6c6KG8zcWhac=;
        b=DUAhF62IaskaoNeEpfoHLlHeU3PANGaSOzakulTGv2Q1wgSyzCjltChgaiGeLaJF4Q
         m8qDE9QqusP3rH0dJEZSas/48bhPBBBzco8dmlw6PYZ5m3pl/ZRKj0irvEn6w69nLVKV
         gbhRYiUknKys8ro1klHlh0N053TnBf9bhVKh3sJLMGpnfv4CUNJV4gt9sMush6OOMtg4
         q2ssL9IxF0u9bFh9hj7Nz3q6MXcwxwta+vmj3KGe2SFYe/KSsWoY8Q5YUdEyw8g4FB57
         G/YMrAmP3RmvpRUVzfp++8MHybDnU+LLh456ZXDwUJPX6lthCngYJAWqXiH14U3KbjOE
         zQag==
X-Forwarded-Encrypted: i=1; AJvYcCX+MIrUzgl8WC1XdUUslHOJWQRzfzKLhfuG9mbihTQbQTpp7T1LRTqiT0B/Qq2GcgaEORAGth9k60pCtvX5hy1j@lists.infradead.org
X-Gm-Message-State: AOJu0YwdV+AO38clpbv9Mgzc0k5opzJXyU3OxbnTKhUMVN0GJTJv4W83
	4N58IKoGxHoqfMRx+l/2HguE74RqSiXbbyrdud6te9XRDKwCN0zA24rqL597YEcYnHvF5SlHrGW
	D1R9uLSDItM1TA8z6zZRZ9MFKQd3hwfcmCFyOThUVGy6VksKuX+BS
X-Gm-Gg: ASbGncvNyfbZTlHfhBYMu5bdXc7xQLdpMJ/oVmiTPiur/9MFUIFBQeJHokYGq/fPqun
	pg/gNihu5zI19K5vhVtXbcJXmROxwFEzliQqheFlz7VCdVB0iluam02IMv7p+/gDHj6Etcu/M1U
	6ZmLtcqauQgmmdibauPf4Kz4vUFl8wqrwyvLXjcsehy6M6Vo1g7cGOD8s4TNGFth0e57qbp6HkG
	ZPPLmg19n9bbhydAHxid2DYeXeC/1KhoXQ6oC66Hnhp+GoFqwe6bkPpzi8a9Vpyzg9z7fI=
X-Google-Smtp-Source: AGHT+IHQakyME6xEnHQQsmuUyerv0hf25mEyF8+JOVxqljHOGLgY+yIGdrozQm01lfyzvPwPJ0stQCUI+cbhPCgYAws=
X-Received: by 2002:a05:6512:12c9:b0:587:7f2d:2580 with SMTP id
 2adb3069b0e04-59576e19ba8mr982952e87.32.1762951499660; Wed, 12 Nov 2025
 04:44:59 -0800 (PST)
MIME-Version: 1.0
References: <20251111062944.3820079-1-nichen@iscas.ac.cn>
In-Reply-To: <20251111062944.3820079-1-nichen@iscas.ac.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Nov 2025 13:44:48 +0100
X-Gm-Features: AWmQ_bkCSMuaz30HpFGccbxR73HuAGmsgiOeKgCmrcMpEXvyI_fFR265lSkc_Yg
Message-ID: <CACRpkdbdXBKq5x1weqB339M6y0HBq_NyBTkJ_7BQMaveTHF7ig@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: airoha: convert comma to semicolon
To: Chen Ni <nichen@iscas.ac.cn>
Cc: lorenzo@kernel.org, sean.wang@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_044501_859584_8A637AD8 
X-CRM114-Status: UNSURE (   9.07  )
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

On Tue, Nov 11, 2025 at 7:40=E2=80=AFAM Chen Ni <nichen@iscas.ac.cn> wrote:

> Replace comma between expressions with semicolons.
>
> Using a ',' in place of a ';' can have unintended side effects.
> Although that is not the case here, it is seems best to use ';'
> unless ',' is intended.
>
> Found by inspection.
> No functional change intended.
> Compile tested only.
>
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Patch applied.

Yours,
Linus Walleij

