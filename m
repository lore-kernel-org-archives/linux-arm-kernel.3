Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE91EC624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 01:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vrbIhRjPzei1dtqxq+ZD3mi9kwyuQdOPberv3S+Q6ak=; b=ASZ8q8+o6F0LYcAAExwMfMeDF+
	qwfRpbAWgcsO0StKNXSCZRABupatgyQiHoO+rqhoBH5LpJtfQrETclSRzpardNT2PsWOWu0gCvHWf
	eqsJIBDvALY6w7Eg5zXrYgeVYtZQTBznd7s+gkiDh2qJhsgUFFYIlBLjGO28YUeTf1XNxag07rPxi
	EQfR3KH4mWuaVpMgS7vXjoJyTiBEbboLB1O/+GNYUXnupcGsaEN/EyTt+BlmFRdyZeBImv7uszSIq
	0iQS0ZpFb6hrhAqBImyLZHM8hIfgcxvTpvh1Q7HEW0xYCnerSfVfBjwTeFb4gG211inkhCtZJ3WqE
	p4mdbmMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x31Yr-00000004XIp-2GTJ;
	Sun, 06 Sep 2026 01:20:45 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x31Ym-00000004XIB-2qg6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 01:20:43 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7ec1e9d3359so1906275a34.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 18:20:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788657636; cv=none;
        d=google.com; s=arc-20260327;
        b=akRd6Ew84SaJfzhKtxzg8bBfBOMkVyoyQ/hx5qE2oA4ooD3dBxzAkxPhgDMPbwbMT1
         l7aK7/tbcwFhaTyQmeInVhfagCF/oH9F/nNYZQGG2C9309k3b9JRO277hUH76pNW4Vqz
         ALvanSFrIxr0wpWfuIAPwnvqv4hm8TP3EUay+yHy7z9EE07JRu1Ab/qgDSNeww9IZSZH
         uXxcmAHaW3Ftn9wi+usl++5WtjanYpF1T9axNJ4v2KE6AOyBuYiEnOqcwSowc4kLF2nY
         vd0VK+NV4CWNrRDJGiMFop0R5lD1V1FSALUu7i+h+J1J9Z1A5W75lK4p+YQnCv4W1MHN
         FFrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vrbIhRjPzei1dtqxq+ZD3mi9kwyuQdOPberv3S+Q6ak=;
        fh=3GDSBsZgm93ukwEfaaYyd6vZpAWRwTlPP3+oDsqC7I8=;
        b=NksVF8Uzgc8dXDbE7PqLlanOmdsySXyvHbx3DMqYbzJIUxvYK39QHiB+vTAGIBtJFA
         dDeiRJNmh1H885EOQ2gr4alTJeuiwQYjZ6/i95Xe/g1ifjahXOu8blqYcsl5UqrMJh88
         qH5tbFAlOKoCfaWAoXEBDTYeB75pxR5B0czp3Dvn5oPiwE7A2bCHDiv/spFnE9f1Usy2
         9BHj4hmDwa+QbiNipfmtKUNdJWJhZ9dHFQ/BZuUh6A4gtWDpwIbq4V6eoY4w2Cjyaa+/
         OUq7DH88PSJ51iCpsLXNhbGB3s1LdQMlC1BA0hCOBnYyzirYVnA17zkKq2B94BO3DhKj
         qENw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788657636; x=1789262436; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vrbIhRjPzei1dtqxq+ZD3mi9kwyuQdOPberv3S+Q6ak=;
        b=C7dFhkuNBp+jpes/UcJeRfGY71NdrxWCm8qSGS7YzpIflZbkEU/4ITDu8NuxRwo0Xq
         IOrpUfHVRaWeZ5AFt0kZcJLbv3iGjU2BmjHVpWrNG6MXXwm3cY9SChVSyV1KPq9ym+p/
         4rc9ZZRXbZQQIndbkR3wQdpMRWQOLL3uoKL4QS1zZe5XDfUtSvu8Om486ZDt71uDlseK
         8hrQC/IXz0sGwsT6sGda3frsL2Swd88smRff0kulVeUtlnbWrbCeAEtDCmbu0Jxac0VU
         z/lZYzX4aikH9vKOSOjuuVcQMiFdh1P50AOUz50i3JgqHX6S5EPiWN533RIpkSVjz3QY
         J5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788657636; x=1789262436;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vrbIhRjPzei1dtqxq+ZD3mi9kwyuQdOPberv3S+Q6ak=;
        b=cA+lKPzpOc5MlKU79DV2pHuBWJPBfJenZgu2aTdIWOHEDws8HEzPmwtcceycQ1RHCZ
         cXpf+8Fsun6ab50aiw8qvh4W/tdpneZRgMm6aQSWpRtC9lmu8+h1EMqHOmZf7TUMBkMV
         0mdiq1pmhJS7TcPi20pABYBPZR6Tup/9JObwbG0Ibya5R7k7eMUDS5emlEYRRhTZhmZ7
         +yyhwxFrj7x0JVAxvnH+eYr3Kx49ZxLtGjfNlHf02/7TiRNeEdESig3q15N/2RR5GybL
         /3HMD4LB5wZlCmM3tW2+Q7Yc2kzppS92IV5nJjcJpkkY6NBfLKQ3jkDW74IKydP317d8
         Fj3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwhVOrUpDq18qc6T48YjDZv5ISbb5V6nSMKIotDDcR3qrIIIUFO8X8op3hjMx8nZbbin50Pj+BDloiQm+ncrV6y@lists.infradead.org
X-Gm-Message-State: AFuF++m+enNCXuSFWvIbQyaVIyfr0/MzUDu5Jd4qncgyaRrK65z87dXa
	7p4nq/2BeyHMXNmAH3yQcNH0RE/VZNWZrjf3iI5TVQfN/BFLliRDNICzeT7e1E52xOvr36KmFD+
	Xli9b4aWI49aNyTGJRrplHdlmaiTx2K4=
X-Gm-Gg: AYBFou3A4yGU9Uz+pJKe1oLiZXeB7YVC/4XI+6kSP7JGXaGh+9Ih3M2AHsJvcoFd31V
	mBsJkJ4rWuaHOI76rrf0CFMkA751ZXT7e96nQOIkgGuufHV8LJaKG3POvzK6JTo4aw4/7TY1EU+
	bYtdbjWALUwqcFI2cu5s2HehNP6t6T3hwaIfj5wxipUr5OMSozm/JyujF5vHBGPIvQDlw9EQKCj
	ZEuRha5eLt9dn6N6qmKqeWF3/QoDgenjuV0jV+jC9powPItuDSf3SA5PU6FaV6hBLMZ8yM13+VE
	u6yAoM4QhFkh5cdC9AiSQUdWvID85pKWgGFoKepAm8Y6466rwWx4X4y2
X-Received: by 2002:a05:6820:a28c:20b0:6ba:2927:3661 with SMTP id
 006d021491bc7-6ba29273f2fmr202772eaf.18.1788657636529; Sat, 05 Sep 2026
 18:20:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org> <20260714152138.7.I5cef580a62c86ba6c3465ad336fa509afbdf1476@changeid>
In-Reply-To: <20260714152138.7.I5cef580a62c86ba6c3465ad336fa509afbdf1476@changeid>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sat, 5 Sep 2026 20:20:24 -0500
X-Gm-Features: AcwNN1W-1EM5u25I6sIYjSAHidxk9uQmu6rjm34oWnomns496rRML5lm1gN-HB8
Message-ID: <CABb+yY3_xBvQVFHEs=v39u7+TLjJRaVv3sg5pGgd0YxCruZ8Tw@mail.gmail.com>
Subject: Re: [PATCH 7/7] mailbox: goog-mba: Introduce the goog-mba mailbox driver
To: Douglas Anderson <dianders@chromium.org>
Cc: Joonwon Kang <joonwonkang@google.com>, Subhash Jadavani <sjadavani@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Lucas Wei <lucaswei@google.com>, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_182040_732633_0BAC4CA5 
X-CRM114-Status: GOOD (  17.24  )
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

On Tue, Jul 14, 2026 at 5:24=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:
....
> +
> +/**
> + * goog_mba_handle_tx_interrupt() - Handle interrupt that remote Acked o=
ur msg.
> + * @goog_mbox: The mailbox info.
> + */
> +static void goog_mba_handle_tx_interrupt(struct goog_mbox_info *goog_mbo=
x)
> +{
> +       unsigned int reqs_completed;
> +       int i;
> +
> +       /*
> +        * ACK interrupt needs to be cleared before reading CLIENT_OUTSTA=
NDING_MSG.
> +        * Then if a "race" happens and another message gets Acked after =
we clear
> +        * but before we read CLIENT_OUTSTANDING_MSG then the worst that =
will
> +        * happen is we'll get a followup interrupt that will show 0 reqs=
_completed.
> +        */
> +       writel(CLIENT_IRQ_STATUS_ACK_INT, goog_mbox->iomem + CLIENT_IRQ_S=
TATUS_OFFSET);
> +
> +       if (goog_mbox->queue_mode) {
> +               u32 outstanding_msgs;
> +
> +               outstanding_msgs =3D readl(goog_mbox->iomem + CLIENT_OUTS=
TANDING_MSG);
> +               spin_lock(&goog_mbox->lock);
> +
> +               if (goog_mbox->outstanding_msgs >=3D outstanding_msgs) {
> +                       reqs_completed =3D goog_mbox->outstanding_msgs - =
outstanding_msgs;
> +               } else {
> +                       /*
> +                        * The hardware's track of outstanding messages s=
hould always
> +                        * be less than or equal to the number of message=
s we queued.
> +                        * If it thinks there are more messages outstandi=
ng than we
> +                        * queued, something is wrong. Assume nothing was=
 completed.
> +                        */
> +                       dev_warn_ratelimited(goog_mbox->mba->dev,
> +                                            "%pOFP: unexpected outstandi=
ng msgs: %u -> %u\n",
> +                                            goog_mbox->np, goog_mbox->ou=
tstanding_msgs,
> +                                            outstanding_msgs);
> +                       reqs_completed =3D 0;
> +               }
> +               goog_mbox->outstanding_msgs =3D outstanding_msgs;
> +               spin_unlock(&goog_mbox->lock);
> +
> +               trace_goog_mba_process_q_txdone(goog_mbox, reqs_completed=
, outstanding_msgs);
> +       } else {
> +               reqs_completed =3D 1;
> +               trace_goog_mba_process_nq_txdone(goog_mbox);
> +       }
> +
> +       for (i =3D 0; i < reqs_completed; i++)
> +               mbox_chan_txdone(&goog_mbox->chan, 0);

The patchset doesn't say much about the clients but if the platform
works like this, I have a strong feeling we can do without introducing
mbox_controller.has_queue.
Just use the msg_data[] ringbuffer -- we can avoid changing the core
internals and you will still get ACK for each message.
What are the clients going to be like?

Regards,
Jassi

