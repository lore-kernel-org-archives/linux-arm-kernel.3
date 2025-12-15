Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49177D41D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 03:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cs41d7yCNQsicDzPOtK67VW5w6RIcuLsk1wC6vBHoOI=; b=F/VH5mz4C+bl76JbVPIjo8FCuJ
	9NhJJ6xH3DDI/hPul6URvDAqilce+/PYXFW6nf9Dcd8YmaaJeIiAYZpUJ4AuJYwLIfLA1flqX9HdQ
	5QiwYmrz1K8ZNjcU7uBY/bE5QeUcmk47/P6XuAA/SA/RUWihgV6xYnQI1STd8pDnj5nTxrgjyzesQ
	YLEsP5S7naRilaWHq23AhVwVLU/qwscSooADCFaldyM59ZslvbjyjaS/33sSmx/z7+BeUH0sKOxMX
	idvbhwjmhd204hv3B5PAbrbX8kkZdjn9g73ICpuH3w/EPKkxayXDgZSdJ9yKb91J1EbC1KIGsVk+t
	DwsDFWew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUzex-0000000326E-0aFt;
	Mon, 15 Dec 2025 03:54:07 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUzes-0000000324i-1vbM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 03:54:03 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-34a2acb736eso2287394a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Dec 2025 19:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765770841; x=1766375641; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cs41d7yCNQsicDzPOtK67VW5w6RIcuLsk1wC6vBHoOI=;
        b=HftSXjF658Q0ZyIGA2EkU1qGzN7/ds1d9ehVkzlEcNQvvg4328lQLWNWaN1rzyc52o
         knU4bakuKRmEcM3txlUSJWr8QAKKvUyJqJP5IhAXWHuZTlzbU5DrW5Paqk1kd3cXih/q
         4C2GKhfkvt7K9/L2W6Jcroaq75ewG179XPuXaReKg8kruISnnYVaEAqj/opaCNEWoT63
         uWMNjF3VDqI3Q6x6iRVDwo9IxNCj4ktuKTLlW5/un2Ox2Yhwxkqvuca7rEysVC2TQ9au
         ZWSId44NlFrCKv29FPolIxF9sLQ7uufKBN1/VbEak7RzoK3/eIgrvdRN/TZH02GCcKD6
         nOdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765770841; x=1766375641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cs41d7yCNQsicDzPOtK67VW5w6RIcuLsk1wC6vBHoOI=;
        b=ln0nFopB164lFHqHRrq9rLwR6VztYL1zZ1DbindFu34lqGeHz0tQxIt7+2tYbQwiTC
         ESzN2H3joioZ+xNOGhThtj6yv8Tc+g//1hLnQnnohBIeWHT5sO1+/ZX4C9vM70zrlihS
         39Tr7X4duaSpg/GBrVDYhuDqTqr3997vTm3tQ3rAOIZYuG/nzesU3S0ITg+PqOXEACjH
         XiKeDelZTWOkryglj98pNYIc/2PtAwBDYW13tPOX4x1MLy85MtqdWxDrOPaXB/EalZt6
         /38pAhsHGegy0i1dRKwGlPJ7mp49DAWAUvwFjSm/laa6zNNNxiVUcFeJdoOU+eP2tjUM
         2pKw==
X-Forwarded-Encrypted: i=1; AJvYcCXFrQWIwRHKfclgYFlT04quUbE6WMgw97TK0OnpFkO2DfDJZO02UXkUPagCYoZ+oE6NUsJNee9/FT2+nnnXU8+Z@lists.infradead.org
X-Gm-Message-State: AOJu0YwYqlcJxpP41rRXX/CEwRp78EZtvfcGq+LTee/GSC5q5GKo45v7
	tdVxeTgbze7+QFlcu1A8rMzCZuqlIh4xWWy29PEE3ELq9pUzeaI+1igA+MWQKTScHd0/ZW04J66
	Bbz2OOP+m6vUaufVTSypSst3lZU2Raa8=
X-Gm-Gg: AY/fxX5FAuKRjUNz0NhIu+JM6AA1hDEJNvm02yuS5r3gJddUAwjlSnAYpz5hQBwjJRO
	iNwvLEe73cP8+x8I66SupGDi0q6COV0gEx/Vpy/1N0ve3acE65JDumrzc7h4DP50jrPh6dF9kVm
	E60kLYQ9kQ3rfhUZBoXMBILMTGVFtZR7gqynopcI1NlSc+VIrKDp02cZbEjSvrw7q0VoLjlxbhH
	l2UnfEBrWi66El3kPaofx1eQ2dWm4QrEy40wHVGuAOAkpf5hg9NOJw1nkqPhV6fYi8JtzVa7koI
	lLvW+A==
X-Google-Smtp-Source: AGHT+IGktv+3+C+sSak5S3BM24sHFO297gHq+KUTFjA6NjjfpI4d7RiO44sokmLBPP2KLBwlNfaQajcbNWc+g+LH9GE=
X-Received: by 2002:a17:90b:2891:b0:32b:9774:d340 with SMTP id
 98e67ed59e1d1-34abd78d3a2mr7741666a91.33.1765770840967; Sun, 14 Dec 2025
 19:54:00 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5BuMLhMyMkfE1xhOwEs2U=+pZnVq+FP+_bp5W_Qg6oMxQ@mail.gmail.com>
 <CAOMZO5BhmvC1_AhcKTerd1p6PdJ7+YLonU59CcHfmpTVavgqdA@mail.gmail.com>
In-Reply-To: <CAOMZO5BhmvC1_AhcKTerd1p6PdJ7+YLonU59CcHfmpTVavgqdA@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 15 Dec 2025 11:53:49 +0800
X-Gm-Features: AQt7F2r0RvjI0X4IfZMMXkA086kkoJNbhuveSQyEiOdiJG9AzHMiJjCeaNWhWHM
Message-ID: <CAA+D8AMMDuakAXSUizUmxdbPZiD_kzTEC_gSS5FVCRJ1nxDHgQ@mail.gmail.com>
Subject: Re: imx8mp SPDIF TX does not produce a lockable signal
To: Fabio Estevam <festevam@gmail.com>
Cc: Shenwei Wang <shenwei.wang@nxp.com>, 
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, NXP Linux Team <linux-imx@nxp.com>, 
	Viorel Suman <viorel.suman@nxp.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_195402_496038_FD9087FF 
X-CRM114-Status: GOOD (  10.96  )
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

On Sat, Dec 13, 2025 at 6:12=E2=80=AFAM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> On Fri, Dec 12, 2025 at 4:11=E2=80=AFPM Fabio Estevam <festevam@gmail.com=
> wrote:
>
> > Any suggestions for debugging or fixing this would be appreciated.
>
> The SPDIF TX audio locks and operation now works.
>
> The key thing was to pass AES1 information.

Yes,  the only supported format is IEC958 in driver,  so need to convert to=
 this
format from alsa-lib.

Best regards
Shengjiu Wang
>
> In /etc/asound.conf:
>
> pcm.spdif_out {
>     type iec958
>     slave {
>         format IEC958_SUBFRAME_LE
>         pcm {
>             type hw
>             card imxaudioxcvr
>         }
>     }
>     status [ 0x00 0x0A 0x00 0x00 ]
>     preamble.z 0x0
>     preamble.x 0x1
>     preamble.y 0x3
> }
>
> Play the wav file:
> aplay -D plug:spdif_out  96-24.wav
>
> or a 440 Hz tone via speaker test:
>
> speaker-test -D plug:spdif_out -c 2 -t sine
>
> Thanks

