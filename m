Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C589D25957
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 07:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8nZkdslqCA+f/H665Ckh/urjA7uqIfjns3j5MmGELb4=; b=oycadVYM/RQrdk4L1ov3j7uE7H
	Wer2dtlVwOIdKos8e0HwqNusOdaphhul0V6qQ8cVBWEqpNyiA+HNpHvhq1ZD0m4veXMpockLq6t//
	LhrfQ/wvrMVIER2ilDVtkt0JGzro5FZY76s3dDhln4wRPC2UIYkfxBeCayxWHcVqgYNGQsridcFfy
	n0XgUJNBnjxgkdhNEIlnIFIKG63cjJmpvRL7T/QW0mtBYbhU51yO6Yv5YFPSdMOvgQ+PhdKwcThHS
	vGZgtdLc39GEOTxbSPGhup9/puGpW2yvJz4ukk0UCr8N7NrtL6SGYFFWcTsCyRoN2AoTL2hCDm57f
	z4YZMtZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkdPj-0000000Dm25-3cEk;
	Tue, 27 Jan 2026 07:23:03 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkdPh-0000000Dm10-2PNR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 07:23:02 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-1249acd6ad2so944133c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 23:23:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769498581; cv=none;
        d=google.com; s=arc-20240605;
        b=b8EYrwbECz66dxW4WIiZwYPFfzic7ueYukm1gEee2ifNhvqMohI9WUP/9pNQogoMlV
         MP05KtcBj17NWzMyQP9nJsbuPz86J29b6tLGWd8T5qHYXvbXUcyYmeo59gjecWB6qzo6
         o8+a2wJHcA+V0dFcKzkKldKspo0VzOj4sDY3dOd9sD0cXco39q9fbZK3SdQdY5JZ8LwT
         B84tRnplP7pZRFjyspzO10yd+gBMjm1HME1vj9CA/uB4EMoKQNuhjJoC5eOOpLBEI8uj
         IKaEcIWwaa9XPTBqq63ROriEmYhgwoAfOfzuU77ObGp7PMm0f/ulVCfQBvEENEW+hfWU
         xPvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8nZkdslqCA+f/H665Ckh/urjA7uqIfjns3j5MmGELb4=;
        fh=A/ben6S8IyJm7A7wrObuev6kA6ip9MPBBDgtkKMlur8=;
        b=Wrde/+tNa/V9RM5eLTqJ0+9j+6QToZdR3gKrgaGNw2Cm5GG7bWF7Zx+C9q82PmDdVv
         o9Y2jp32IVnxDnoafsnqicAgVSGLR3ZjTYctj4dpRzePYcZ4bkqZrlfIpz4c1EPayDAA
         8bpoQFgvIKhgyCfWX2IANLEGu7eCIlpxtaGCvLrpQnhUbjPOT6wDjNYaP8gGJOG5B7gH
         9jeZwVT/JBdREbXmmNek7mX9AA5la0AOVJGq+IQ2cFHi6VLzkhXVXHVJwTJZjDCi86/j
         huXdJWWacvsm0Wk8N2I//mmRrsdiSNwZdiuFdlh3mkAksXWHzdUmHTw4n5M9ipjHifwR
         HZrA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769498581; x=1770103381; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nZkdslqCA+f/H665Ckh/urjA7uqIfjns3j5MmGELb4=;
        b=bu2k/bMmBg5RifYQC1Ocw16lAnouhSbg/smQGMgdSBHUvTkdpHC6VxyJKay5ukPfOy
         zMt85tUeELtgjS0fUT3KhNLQlSedUjOSZ14Ojt0c4ecM+UlDS3lQOj1b1/DopSCFyqqG
         eucyt5jgaIrdQRw3xCoGiFmQUEEOngKb3t7lfvja6u1d0j+FBVW8AzlpOu5fn521BnO4
         avAfIA5ztDdjFHNkwbG8vzSM8233mdi/VAJN7RyTFimi0Lqwf2Nji9ty65KHzAHz7tkY
         c8B0rPCMG0qq8NGcQHSyZIkSeJ/QX8WTmWRPjcsSH2YWH5fYhVus9M0sVnIjU425t+pF
         jyQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769498581; x=1770103381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8nZkdslqCA+f/H665Ckh/urjA7uqIfjns3j5MmGELb4=;
        b=ZUyuqc4/UiAt/Sj4l3MJOzcsBI7LTUxEqJW0nCWcz2HnclrTIkRARicbPFExbSu1Y6
         CW4LM1h3DyMSMzmPW65XF/S8YL35ipb0+f3qwNvDdBlWWESw35vt4t1rH2OirJsXNuLR
         CSf/Y/aPmpPN6WKJgd2yRwFmD1CqKERWuriNIJOgU88bZuMU1ECV1yG2t90C4HylZDrS
         YwaRP6U/uoDiNQQMHnvxJl9O2qpqI3aifNRM0gg4wPl7vaXyGdLRYXjWytD+saZ1zg0k
         NRhb9TETkkmK+nOG+I80spnw6daFWagwlu2FbRo9KLHQNyQOApF4GG2wckc8msWBfRWp
         p2/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVG7bgsKn/tQmevctDuNbrcD8p4AXlHLtGq4aWHs8hvUdSDEt22sBJpSlyI/1Ye3yQA+/PYVI3ss0FUZrNKiFep@lists.infradead.org
X-Gm-Message-State: AOJu0Yy19HjZRvLLmhpKWEhnzWl3IYGznbJbUr1VObUc/uNuR0lQoWVF
	aj992NeN2AppTJ1u3Uw0OlBjtaD6ft4/cdV08b0HKTHaYWDzolfTm+y5A9CblE5GqhbKMT8Mh4L
	Oq5+Tn6v4bwPU2ZwfJC9k/MiV7iTexB8=
X-Gm-Gg: AZuq6aJFG5EQv20JJxWxalVbI9SkBw2FV/UuKYPhw8qIUwCoL8k1Whfqcsm7g2uQC/W
	Y6Dhgqo1nAke24/NTr1J2oeRNEF2wVc3BCzMnrrRjZrYqLTkBpnE33ul7WziWJ+bzu+IzzGJFsO
	9+D2vavGwKuCYW+JsysJc2d0sh6bKtol7F9USXPOqApQex2/n8ImRT/mk0R8HOBlsTzpGcVlRQ4
	3CONpjAy11L/X3pBjoFUMRYlrPurnWVvvcLwZu7UTAJDop0Bk7qcsX+/zNfzEkipN3jBl2+oENN
	O1L2sjj/66MixMscxIgYswy83nVKzIPQfLWw6XDsEomcwjmHLtr4z9MATBFgII7eTBeo36OzZeZ
	mWJOTPUSeSASgMg==
X-Received: by 2002:a05:7022:321:b0:119:fb9c:4ebb with SMTP id
 a92af1059eb24-124a00b1ba6mr483038c88.30.1769498580625; Mon, 26 Jan 2026
 23:23:00 -0800 (PST)
MIME-Version: 1.0
References: <20260126162203.708-1-laurentiumihalcea111@gmail.com> <20260126162203.708-3-laurentiumihalcea111@gmail.com>
In-Reply-To: <20260126162203.708-3-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 27 Jan 2026 09:25:44 +0200
X-Gm-Features: AZwV_QiWy4qbwZhsK09ISU2gBuNHOmG0-KHSaZiM6EoVfrKve54Js6OaQrgeXNQ
Message-ID: <CAEnQRZAWxxYJF-Bn0=Hnn1uPys0xgbcG6JDPFFo39Y+szEv1eQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] reset: imx8mp-audiomix: Switch to using regmap API
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_232301_619493_C121306D 
X-CRM114-Status: UNSURE (   9.41  )
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

On Mon, Jan 26, 2026 at 6:23=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Switch to using the regmap API to allow performing register operations
> under the same lock. This is needed for cases such as i.MX8ULP's SIM LPAV
> where clock gating, reset control and MUX-ing is performed via the same
> register (i.e. SYSCTRL0) and different subsystem APIs.
>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

