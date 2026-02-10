Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14C4E94626
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 00:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bf5IdcegF6twrrNNR7clze4xkdFwkIRE6sG++xaVg4U=; b=VFOHoNbnvFV5XBo08yBgPINPtb
	98/+GKaTFIBxPQXm4OMTQkPd4/KWPx0nd11DlxXwP9ofEDtLBAWLy9e5lgv12JMbyY92TMr/7Yxil
	LZcmD+oEGza2lDZdAEIFspqitoXbYy/UJcFcZ9kHWn7AncP2hV647sqxS60EWSSWjX0m8Kap5WXfv
	rSJDeHSw26Teec4OcubZJEoGZIyOHtJOQTAZ3puweF+p+2V9JYCOz7PQ40XM0Pl4EMB8rEQKg9Shu
	kLlZ+gb5s7kZwV36QSTr9rmeODuXNV+h61r2rBp2eVarfn6ufWpG/yswKvGyZaHqa8FXTyUqAGftt
	3SQN8ksA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpbmb-0000000GEbJ-1li5;
	Tue, 10 Feb 2026 00:39:13 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpbmY-0000000GEao-3mgJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 00:39:12 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-66f343a30ddso1200793eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 16:39:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770683949; cv=none;
        d=google.com; s=arc-20240605;
        b=SXx3LCd74QmpdE86tqlFE07hSE6kCN1HmsyBZwSUQ72qOoSMOlqnpNZLVmxp2y4vc/
         5r4/ZGiV+PfHPa6MMvsLk+JZCVELutYTwUfkPFdiDI/CMDRTv69f5oZkvkwTdY562OYt
         pB1l7YJwal3nIGFfH2mk+OTA1XKRb4riOdY4JTQYD+xmx99v+xjiErwbzbEVMREjoDkA
         //UQG8dZde6lVijvSB2RtZRpMSBflDnOv6Eln3BFcwZiwj5u1ihDUrQDDFFzidtReSQb
         vzyB1TwMNufKpL0pp8kgZPgj6u25TsZw2Ghup/YoAmyLcEWDJ8xGFYrwzvbP5IB8oLQG
         yJ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bf5IdcegF6twrrNNR7clze4xkdFwkIRE6sG++xaVg4U=;
        fh=ReK487gLV3BuFQQQ+HgoZtKzLk1/BsjRnLTN9LbmwzQ=;
        b=FsXW+HX5lYk4zQ/bhVh+iq/4GFr4hr4u/qI7g3GGaWZNiavgzx4pb2gX9BSVboZ7Q7
         Sl/exWlG3oxZiCqc62AWewsNDqlmrdz6rfvSlLa7ay8Eo5mCe+l9U7nwVLvp0fOL1KXq
         n1+UkRT2bCSNlpnPETMPv9YRIDhKgKU0XbF4MGmwevcyCblvtAXQBhowZERVSVQgZkae
         yitFQtaxFzpPjWvYGG39evZ9lJgJIaz85GvHGa5K9f0bwsoxwTVZspmsJC8w5JYcxnXG
         9rXHwSrxLNLVplY+WzqDiG/AyGBohlm8PwJBNyGDhX7f5R4WBoMu9j/4e3/iDSa3Pwgo
         KBOw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770683949; x=1771288749; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bf5IdcegF6twrrNNR7clze4xkdFwkIRE6sG++xaVg4U=;
        b=XkgVJP4ne9a04a0iUWYBkCNEwMulMywdws9BdLT/frCzraDMoG3QOwUs9NXHhqRZLm
         pPJ6oDNTN5D1xStoZ0hbP6LN61B9gfk+6hekfOJKSdwzvImb4qAw/JvQkcmG2trBEx7s
         XViQoxb74UX1e/9JQP6tP7vVR8emkRGLc8QXlMcPLqR8DsCz1ZidBjtblSYXKdUTV7/m
         1kOpLNyNJa2eUXkOmTd6vxr+U+cUTBj4F57hffqFppcKzi43uRNUQpgkz8Nf6VzELU0S
         edbVWDL8JKKtGL44/2Uux5J2TPZVNEXQyYEbakD9NkSvBeFHUwzkXlTuH7GlPeVuyfqu
         zEvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770683949; x=1771288749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bf5IdcegF6twrrNNR7clze4xkdFwkIRE6sG++xaVg4U=;
        b=WLBRFGIIrxGGGCRt4yZ5XvWfy2FcXBMdHRqN8uzzXQWElnPYDbF3DOok+Qh8DxvWRk
         yjhFB5pZBnPwVz2axHrhVI3naEDAMBKpvZ77hXIQe6oz359A4HuFXc/JKNIsIJHF3y1s
         miDQlTcaDhSjQ5whjwsyBX6ufOQgMDxzJaOqJX4R2T/vZx87R1W8WdzqTKBs/ymmjnbC
         36kFJJf5HIAy2glVNDPAQQOp3qwmCAms9nUt4xiuZjonyjeFkz7XyNNoOH8RYeBsJfDS
         BHKR4Ov8WJfrcjoCgZBko6FLBH/3x+QW9Q18UA0Gw0DAAIskPrXU4DXgg9QPaPkoZOn1
         TOAw==
X-Forwarded-Encrypted: i=1; AJvYcCUdu1I8+mVbSZgrjz4r1bH3+hyx2wpc3jM5gArI1csEzcVl5InJPr82qt9MPbTfUQh8s4e1pMGTtXE1vH7BVs2q@lists.infradead.org
X-Gm-Message-State: AOJu0YxjfAzba/VcFI+zkWrsU9z7SrA7d4nbGgv8k/e3rFizRYOCTOOG
	1WnlwaECMF7hUmtqx2AJLwcHFyqaJWaHkz1b4d5DB72j4iFXhAjSpjHPFCBQyW+yLs1EFP3/5ji
	HpK6jhNlNlrIGdHMypVFehjnRRkUd0GE=
X-Gm-Gg: AZuq6aLuM5lfH6I6oAab7UhB16oDiF9FG2YkffKw4rm0+3M82KM7CiP9v+SGoBBtE+d
	d8rW6R/MVBjy78CDW4/4hjXhJZKZ+eLJwNRSTMQHQeIvjptEyWAD3WQhz9W6DQcKWauGLxkjbQC
	cIw5wrHEOYbhGa/ndDiDRib61OT0BBo5Nopj/dV43Wvwzif7bfh9uDo/Oc22O2xbKcUTxSvO6Ck
	ouUsxKjO6OEM3Fa7zAEsp9GMolbzXSniZiGh1crRw5z4KlmdNLdUf3b/8d3qtbDZWSFTAcVZXa6
	ZEXYMfdI
X-Received: by 2002:a4a:e908:0:b0:65b:257b:a898 with SMTP id
 006d021491bc7-66d32fdac10mr3465078eaf.29.1770683949518; Mon, 09 Feb 2026
 16:39:09 -0800 (PST)
MIME-Version: 1.0
References: <20260208040240.1971442-1-dianders@chromium.org> <20260207200128.v2.1.I600d04c0553f5c5ba39c2f92201da313aedfe746@changeid>
In-Reply-To: <20260207200128.v2.1.I600d04c0553f5c5ba39c2f92201da313aedfe746@changeid>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 9 Feb 2026 18:38:58 -0600
X-Gm-Features: AZwV_QhZe5s2jbJJnfFS4JALRsv_5-7Jio6ijB129QGrcufx887IYcSq_3ToyAU
Message-ID: <CABb+yY2GbPcuPiVsE_-HCS8MbpBqvjgjDkoVLNSBDZq1bnfpEw@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] mailbox: Deprecate NULL mbox messages; Introduce mbox_ring_doorbell()
To: Douglas Anderson <dianders@chromium.org>
Cc: Frank.Li@nxp.com, andersson@kernel.org, arm-scmi@vger.kernel.org, 
	cristian.marussi@arm.com, festevam@gmail.com, imx@lists.linux.dev, 
	jay.buddhabhatti@amd.com, jonathanh@nvidia.com, kernel@pengutronix.de, 
	konradybcio@kernel.org, krzk@kernel.org, lenb@kernel.org, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-tegra@vger.kernel.org, 
	mathieu.poirier@linaro.org, michal.simek@amd.com, nm@ti.com, 
	rafael@kernel.org, robh@kernel.org, s.hauer@pengutronix.de, 
	shawn.guo@linaro.org, ssantosh@kernel.org, sudeep.holla@kernel.org, 
	tglx@kernel.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_163910_946325_93D62135 
X-CRM114-Status: GOOD (  15.42  )
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

Hi Douglas,

On Sat, Feb 7, 2026 at 10:04=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:
> @@ -249,6 +255,28 @@ int mbox_send_message(struct mbox_chan *chan, void *=
mssg)
>         if (!chan || !chan->cl)
>                 return -EINVAL;
>
> +       /*
> +        * The mailbox core gets confused when mbox_send_message() is cal=
led
> +        * with NULL messages since the code directly stores messages in
> +        * `active_req` and assumes that a NULL `active_req` means no req=
uest
> +        * is active. This causes the core to call the mailbox controller=
 a
> +        * second time even if the previous message hasn't finished and a=
lso
> +        * means the client's tx_done() callback will never be called. Ho=
wever,
> +        * clients historically passed NULL anyway. Deprecate passing NUL=
L
> +        * here by adding a warning.
> +        *
> +        * Clients who don't have a message should switch to using
> +        * mbox_ring_doorbell(), which explicitly documents the immediate
> +        * sending of doorbells, the lack of txdone, and what happens if =
you
> +        * mix doorbells and normal messages.
> +        *
> +        * TODO: when it's certain that all clients have transitioned, co=
nsider
> +        * changing this to return -EINVAL.
> +        */
> +       if (!mssg)
> +               dev_warn_once(chan->mbox->dev,
> +                             "NULL mailbox messages are deprecated\n");
>
Nit: maybe  "NULL mailbox messages are deprecated, use
mbox_ring_doorbell instead" ?

Thanks,
Jassi

