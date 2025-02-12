Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B28C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 20:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AbCZq/KdfJ+rz1uUl+K724BtkWwa151wsTK5+/vxmtI=; b=ypYGdllutm0pVa9DnHo2h9HHJw
	0hfjVYLjiYzNwjN6TDj2NxEtbU6PuwRqPkiU4oyAclAZL/3Sy82p9dvwE/PhLj17bTS2qsM34nl5s
	oqM7CYMZHFd2TOddg3u3sWir4OAVbLAWZQ/k/BdB0K7nkAezEBDSOi8OJEOdOqtnut8nLiuH4Jpp9
	2U5gDrHXYvlLmMbtpTua3ZNC7BZUa5QIJAQBj02ExwJ90kVtBR9od9KDp3pm1V8fqtPFjo3SIwKv1
	HewyAh1/N7KYyaCxWebRZ/tGMyjv114XyBZTrIABZ2W5/lNL8/WNzO+iE8rqo32JjUO9hjFPdPxL4
	JV0FZooA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiJCL-00000008le5-0Mck;
	Wed, 12 Feb 2025 20:19:05 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiJAv-00000008lXN-18Lj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 20:17:38 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-38f20fc478dso15985f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 12:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739391456; x=1739996256; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AbCZq/KdfJ+rz1uUl+K724BtkWwa151wsTK5+/vxmtI=;
        b=xIkidrvyZxRxF8uczV4Zaz9OC80gw7hva1BJtn+qrrI7x3s2I7xL3aWJie1wNSuAJJ
         P7G12zXEDUQX0FblVeRN3j+lXCUMM5Ba5Aa9GqW4i35BlDdWncVH/mUWvGXVy3O4EAOD
         nbMyyA1xqJstvsT14xcEQTl5VWftFlSzgGiDCm/l7/CsQt+zEVebbDsKgjchUi5TpErr
         IppEqYuR219Qal0sKWro+BjHmYX3WPFl12IJzEe0wSv8Z/tIa9F30M2S/g9eWyUdk4rd
         UGpFfOSYJPFaCqGTw0wS7ogUcky0ZO8nYv8bKgtdmWaw6xdjgWUeSdbV6+pwEFmzfCS4
         QtUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739391456; x=1739996256;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AbCZq/KdfJ+rz1uUl+K724BtkWwa151wsTK5+/vxmtI=;
        b=YfCtt2al8OrM3poSJ/yJHcy1Xatoay2U++0l2GOgiqCTe7DInFJ+Kvds3dvQajY/7F
         xq1KUa7Y5UWnZGIQQn1pGeFpvhXackPtFY8HmWAFBLCIaQukHX0kSeLHcj2xlcquEh3Y
         JJUOFZNr6Fa5cqZmPAhNz53JFviN+hh6aNBwNLYdY+Qfeb24S/QegsQ0LrOdbzITXFnB
         c9wjoVny2TvZABywULiNLLCxqkWX8ufXjttTwpveY1H8zj4/SPQW7Uusq94nZBrrzVVz
         d6IIXTXLd/m/xi3rOn3lTwxLE251CW4scqNUsCueb4CK3hggTVzC+tfu8GEvz5jNBHbV
         yZLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjlNnvnrOFwypEpK2ueuUDKtG4LtyAjXNZxfhsTqrz4LF31uVafeYcMWfzEOusyAtjO54Ua/FaG7WC5ykZI0KF@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa+o4YcBDpYW4ty2X/j1prHjEepYYnQg3wSFBrdhaW+YuY7KVF
	HepcrmPW0nsyHTExJlAwCo4Qtc+bKAGi9JqBPOuG7fo8jk0abQSL5i6H1Qrl7Jk=
X-Gm-Gg: ASbGnctYeECltvpWVcQDRA3kUMY3dyFVHqYgJPWZcLRo4TW1uKK1LIyqzyPdRU44cdY
	d3gD03PPJvjLEePZcg2YOiTGffiHWxRbmY4V4PY9b9ZsyPQlGyFydt1jjMsstS9+qLcdqBzbpae
	BQnSTfXeTbQUCvHHI+arfwAKJR1usvydQEW+2M65G30UxYXlJXGq2gLSxLRBESHWvfvbk4AQpsx
	nJdO3barBxsSuqmohi6MpB52oYO7iSjp004Zx39j9wKgKnXHQi1A7qswXILusWwdeTxBdw2AN0L
	w79PQ/0tZXdJGJ8JTFHMNq4iWXy8HEk=
X-Google-Smtp-Source: AGHT+IHEzgbSwZhcHl5Unf6X40IETyxliC9eFPUo1deP0nfYqwIuq7PnG2+W9zZlMsgMg2uyJ/GJjg==
X-Received: by 2002:a05:6000:4184:b0:38d:eb4b:f9aa with SMTP id ffacd0b85a97d-38deb4bfccemr1276223f8f.5.1739391455757;
        Wed, 12 Feb 2025 12:17:35 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38e6ccc8c1dsm2386845f8f.101.2025.02.12.12.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 12:17:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20241222145257.31451-1-krzysztof.kozlowski@linaro.org>
References: <20241222145257.31451-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: dts: exynos8895: Rename PMU nodes to fixup
 sorting
Message-Id: <173939145421.15132.11778260219053817821.b4-ty@linaro.org>
Date: Wed, 12 Feb 2025 21:17:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_121737_327017_39262437 
X-CRM114-Status: UNSURE (   8.47  )
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


On Sun, 22 Dec 2024 15:52:57 +0100, Krzysztof Kozlowski wrote:
> Nodes should be sorted by name but it is also nice to have same class of
> devices together, so rename both PMU nodes (A53 and M2) to use "pmu"
> prefix, instead of suffix.
> 
> 

Applied, thanks!

[1/1] arm64: dts: exynos8895: Rename PMU nodes to fixup sorting
      https://git.kernel.org/krzk/linux/c/ee24a95b891a215b5fbd2f6814754301070653c0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


