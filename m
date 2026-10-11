Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC6DCA9ECC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 20:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cMamgJmk8vH3egtGQxv4sn3Q+mvCzsBokUwIGTdvv7Y=; b=ntH15JE9HDW3D1zIRF1hBXzYTa
	JLTvhr7Lrq4kbWE+SMA/GI9EuZWwuWTdAbbLSg4vLprhgBFc9A/xkp+gLvuvW6k0G2qFzBqENwUya
	fP8yIT8zIJAGnJi0Rf5jwFfY53R70sQ4aYkHXQe7F6YoSYmAfVxAcM6b6dDM/kzxF/agCy+zT+tek
	vJ/YCZTaty8HEh97mJ7g8cuUOFj6qP6Ry7C5EI6Ch+HSmX5fRXzqpCZFwohOVc0flZvTvEyihjsgk
	Tf1LVuA700+tNMwzo5Vu3zAqMOAugeUL3yyv3WZravuv3Gn7c4WMpPa4ZLEiFBCN2/0f7jJYmE/nu
	UfBZFutg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG0L2-00000009Ove-0nK8;
	Sun, 11 Oct 2026 20:40:08 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG0Kz-00000009Ov0-1UB7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 20:40:07 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-677aec6ddfcso913922d50.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 13:40:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791751204; cv=none;
        d=google.com; s=arc-20260327;
        b=Dw4dH8ZZt1qLGwQfWIghgAempt3kPaJW46TCmrCc48WHhYAR0APqvbGwMQ4mls1C2Q
         E5xk1sWZh9ze3QOgSuIYE/OvoQwTwTso/TIpAoTrrMWMkjrPfRvli78OdlN7maSJc9Bs
         xQt9pHC0bMojsgrIdt+RklP6t0fP6x36xFg2+Z0ojnpS4+sKeMqFr9v4rjLxA++V8r7v
         4iwf7s/5Fy1LAg7fR9QDNos+TbkHIaaatBGDkxFji+3O+Q0J6ZOsUg8Vsdl2kezxDgFa
         FZmDDUKUykNWfbiUC7T2NwCGlnuw16xFArXHTl5ygsm+9jJ5VlqcDeh17xuEO4/D8iFF
         ZBdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cMamgJmk8vH3egtGQxv4sn3Q+mvCzsBokUwIGTdvv7Y=;
        fh=IfZUwKS9iC24WAUszwu84/Dyzsoe4LQCQA/s+kw18nM=;
        b=LXX5xlkw2b1sOIx8gCBMQVat+nMQ3Vapij8L92Ct55XO4syWzo9FiwOmdqYGNBOhuQ
         9rZND52mnKTl7vPlu3Kvyfxp1UAvCMKufkwFHybt/YJ7vuEZ83H0SaUWy2PZjketZ986
         V2eAamGneYhiiwOi56D1ZnEOzvo7wRBKuV8sZeUFd/723sYfyp84V/u47pVL98XLDPi1
         HDa6h1dB60qArxu2zid4F04IBSF0Um+VzLIxKF+iCiheo+AsE58Fpi013GsBxDeeOnJq
         tP2Adgd4rmoS8/xS/mZSgEjXRCsW7wI+Ok4PW/AtqesBwHtEZK/U7V6OEZJJZWTXnlvz
         8geQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791751204; x=1792356004; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cMamgJmk8vH3egtGQxv4sn3Q+mvCzsBokUwIGTdvv7Y=;
        b=WyDbr84IRdP3d7uvrrDwdOHFpoR3XWy5KcxBw7EK1NbQYvQwPzbK9C0JJq8DG5qEqw
         zPbnLzEIYYunNodSBMJOSzs2ljKLk1OyQkuVnMbZmb/TykH3mb9JqlAnGRexxrWtBSas
         axIM5KeVS6W0ZlHwCdSp3eP4GkaMT6bS0H28BG31mzW1w73iHioDx9h/qDA+w/lGgDQA
         K3Zc49bwdpzBBEzPekipd9CrkVLhOBbtdtYE11/J4DNpENqMra+OvDkCJhyHHVS3lHXM
         Aqy9UpcAcoWDAgygN4AnNbEBK0lER51k48i4I22AM0WLoKrbAkNoiZqPA8s2q+rCxPQQ
         vzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791751204; x=1792356004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cMamgJmk8vH3egtGQxv4sn3Q+mvCzsBokUwIGTdvv7Y=;
        b=hbqf4tuWI44qlTU46npMvqlkn2w7XFpjw0r+wPvbkkgMB7v1tCelkId1DK6XY0d4TB
         YpxXz4EQ7tPc+7U5mU0d0q0zGy++R7s3TT3i+Q5nJcBphK+7F0lse38t7D5gttsm2UXH
         DRFwSREh5ZmoqHp6Rio9HETmHVv6NQfR3HMhbsBqyz6WiaLRQX/iSo5u7YKIw58rr07v
         NPKxlOb31gBnHP6Fn6rsp5f8cDN9aFPzUT+sI3h5yIQ+RZ634o2s4XmBiLbKRJZY+JuE
         MEu9iENsiseuduF7PiUjK9AIDOow1HrKzEBy6yF3GddemU61IDkfqGTQkDrZLuGSyT0k
         U2FA==
X-Forwarded-Encrypted: i=1; AKwUvBx/ox/F7pjg6nuU1LBzwJxvnrRLc3cb/Ch8mVDY8ZPxtCyjQSjLY03AYL3dnel82jfFoPRtW63Stc+fpVDlWBxm@lists.infradead.org
X-Gm-Message-State: AFq9FYIZuAe/2IeEGykXeKZBtSXU6bGVQfmy8nr13oQnB0ikiKhiAVAB
	JHTmGAb2iebUyCIfLYFLy5z4TJ/l+bLhVWykDfsO4tQuK3ZI51VIcwLCf67ipMnim4eVl/poqrB
	hGdOIH7Qftqq0lV4ALbl+8QLW3vpCvHc=
X-Gm-Gg: AYBFou0LQtpPthEwdpuVOLmbU3mX0u3nJzlpf7b2m0VwGmQLJ8cTKiAIE9l1aG+v5ka
	/XajebBEO8XzQIvVVGCnKo0zAOsCS3AGGFn3U+kcyRv2kVFG6gzkd/hee/VH+0sglLseXq90YPn
	Llpw78pOvROiTymTTz6wTLaPKpLZBlIAetWp5XnOdIsvARhgbhyX4dc0tJyrJq4MsaT0Jap+h5S
	K3xAXrBGP/M1AsvAae49Xo/rJNgW8JotgoqwjMjH7Rd+2yr+y9seK9zns7BQzawqEoMR6PC2mTe
	RMi15XRwt9XIXSR2UNGYlVAM0pJwsjfQjknYXato6gAciKh7/8FurUW1+Q27i+w81zkGS6dStMS
	WsiPI+vGf77u9
X-Received: by 2002:a05:690e:1519:b0:677:af43:e258 with SMTP id
 956f58d0204a3-6793629ea83mr1945754d50.117.1791751203712; Sun, 11 Oct 2026
 13:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20261011-odroidc2-dts-v2-0-a3a4a752f2ab@gmail.com> <20261011-odroidc2-dts-v2-2-a3a4a752f2ab@gmail.com>
In-Reply-To: <20261011-odroidc2-dts-v2-2-a3a4a752f2ab@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 11 Oct 2026 22:39:52 +0200
X-Gm-Features: AclHuK8O8IYZ2ORxL6RhWYJwVEzArYZ9TYqeOkNcn6oWSppRxLJliDi6XNzarl0
Message-ID: <CAFBinCAwqKZcUegwsFzom6398-BVmBFH8sekgyDp4ZPm8qYvUQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: meson-gxbb-odroidc2: use color and
 function for the status LED
To: filipp.dunsky@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_134005_990379_0A9719F7 
X-CRM114-Status: GOOD (  10.17  )
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

On Sun, Oct 11, 2026 at 8:31=E2=80=AFPM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:
>
> From: Fil Dunsky <filipp.dunsky@gmail.com>
>
> Replace the legacy label on the blue status LED with the standard
> color and function properties, following what the other Amlogic boards
> already do.  The LED then shows up with a generic blue:status name
> instead of the board-specific c2:blue:alive.
>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

