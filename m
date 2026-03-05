Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E87EEF30D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 06:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SJnKoH2k8aUsMnHN9s6q8EPoGOgHGpVja0sh8tMg5Zs=; b=lDZ71dwDnXxRZyQI9WVVx0nB1Z
	LnB5wyx8CAOzZNKSTObuYuR7BReTUYLP3C++hPU31dhmp6SlJOHH+nko2u9PD+itVUFIegkcha9Vk
	TQ/bz4OzvbO+4K9sgmLk50DlfkA0bAqfNg33A2dLlmqIT1evjOW85/tzq/oWXUq5jZQBs9CSkmgra
	dm4Oa+N1zyKXiFyB4e3z6ObERgOIR05WDpxRxdeTBP6IbBsIFgmIc6KiErF45wnUzfkYhud7CfKKi
	JVdDzD6sdLe1XJyYQHlPV6/tv3dFIjyQsKKHocWG5HlD58xaMZf3eZ4DdyYM5QhnaHk+fujq4wOyE
	lopMbtLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy2Wx-000000012df-164C;
	Thu, 05 Mar 2026 06:49:55 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy2Wu-000000012dK-3sNM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 06:49:54 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-1270adc5121so9631204c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 22:49:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772693391; cv=none;
        d=google.com; s=arc-20240605;
        b=hCCQSRWkXje6ANxIy4HzuCEBQxkAa63P6z4mCBOIeoHyhmlapFfJPxVfcTqGKXBWLq
         DLqE7JDV898sL2FVBncH6PKw7/u6+04nZ/F2Y5NviK60uUniSDwmymJlTtCNdwqeZurW
         fzFtQnf8a7P1wwfIEl6/g/DgdcpinjbqJaokDu5jVQsQ+ynwF0rCR7Ilhp/w8JgXI/Xy
         Th3IxA2iV0GKaXtXAtMg/5Iu0ASatzkQTH8BTffk+La7XEo/mTb28+5OCIeMOfsWnMnD
         V5sxU60SD6vwRQj6+AF37IcXfJAT7gI8k+JjqKLhHHd51E/Vchx5ND9gQkM9gFMV29+v
         BtMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SJnKoH2k8aUsMnHN9s6q8EPoGOgHGpVja0sh8tMg5Zs=;
        fh=tJqzp2s+fWAnT+O9nx+5kSok7JXn91pdoeyGlPaExFw=;
        b=USWAUa6jrrbznXuQSKFsX/fYV2gDjIln8iHS65g2ABF2B80RYeABx4NYic39d6aiow
         6uX6zRBu2v5vNGDJaVberKYNmwslec3MWbcX5fGWLEKIdIqP9PhekJGrzkJ77F7VoAHt
         ZGMFLH8llsTuz2eWLVGWYwsKFuPT3a2bgOhydQCSAPs9M+oz8RT0gw9Z5h+KlcgzjjtM
         FP3MRy14JR4uhD6gN1L6gdTRcubFw6p5K/9c8T7nyHncZ/KN6tnzQ1UxOVrGkQKIC+bG
         MDDEKwlgm2CGzXgFL0XhfqhZlJBUe6ceAXBZBYhUnh3e6Vs/oZLpMzGLBDtjdoA7fgAd
         xORQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772693391; x=1773298191; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJnKoH2k8aUsMnHN9s6q8EPoGOgHGpVja0sh8tMg5Zs=;
        b=MDSB2yc+LDD+HMC8RRuzlvBHGAtKvvUCwlHboOvSj6RXXahFgRTNGk7h4Tr8w7c4dW
         xVDDMr3xLTkltaugjHnQs+4yhhHaKkPHzqxMHqrj9mxpeaTJB4f3nI9TIKc51216WEbq
         9OhfOK4LnwV8vHKWqqt6nZvhhNYnQEQbhOtXjvEOpPbIpZq8Sg2XhNztlHwd/fICOC+Q
         uImosK+FaHeWkF1gawgkELIiBpHlc4AFrOATqFNfcy3NP1uwlDl+hPNoWjXZ4/k/3BEE
         VFDz39JcfveXdqGza9+nSsouC9ZsBCBKTZf1t7T2Ain18rYP7XigbA24NzS+RXdcHNt9
         /O0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772693391; x=1773298191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SJnKoH2k8aUsMnHN9s6q8EPoGOgHGpVja0sh8tMg5Zs=;
        b=IOK8LkoW0nY7WKFLrAOfY8IVTbXTAtpSxFDEMGOssc9dpIUfslnS3RpEBnIiVV/rIk
         PgRhCLClbOUVIdINwEIsbEEAnAUbQX3BXEcrrwqZElooBiCsg0FHnvPWFonR1dPffmGa
         btCB4NlnAH/8huOi3hQCVKEP2anP9EKn47c0Erhgbp7GWzK43L6XpkKA+Pp2bUybrY6t
         s843jH8DRsA0lhdqYHNxCSZLm6N7ywGl4wcr/cZbOb7Nv63chQlbWuOzwr/TaYkNGQkr
         N7HOHzKhsIWoBr8Yb8ONJnlrCs5P9T9RnYvYkx+Hr2NV6oxFKi4ERD3eAQxuqXGLa+OA
         lsrg==
X-Forwarded-Encrypted: i=1; AJvYcCUxQdRDJueS7LBSOAw/7C7i+WvsZQZWS34clPzIwnLcUgOUdYkd1KD8BtscobmvyrDGW56gwz2mMFibo+wxqL7i@lists.infradead.org
X-Gm-Message-State: AOJu0YzxbKhv0GUdPw8ZilINJ2ESD/SpCYpwhJugatEk5K8jw3PU6Cpt
	pBuZrU8DXPQ/umccgedHAywm7tqqpS08J40/ViWAZ6wDK4QUmAIaeq+2HAmDUMh0BQKzGpYQWxd
	cqenE/7wwdkpNVvcm9u8gwEer3kY5y0U=
X-Gm-Gg: ATEYQzzQ6QllLv0cA8h8SUwKGmVr6FWaUQezAASYhYxI+6g4CvpkXHsavriVi23T5UK
	GqoTuMfjg8ibPX6Y/uTC/b7j3cGUsMb8uWMhRGBlNSVOGdaYRJm2ZEbVfTu8NfQJKzhJZ0O37Gd
	Mh7kxArQMskiKsDOnk0FDBej1hayjDacOL8viiDBqVMVru1aJIhrViqCTOq4qMAhCgjXUZDg901
	LV27qGLu6AB22VkUALzOVSUwFgJK+nMZiwq92b+qcquA3QvWi5hK3gcxkc/FJ4k1k6RTKCes373
	9DnQw+6gHF9XXj5msYfDicAsgsdEWrjjCiYtlP6AMU0LWfaj5OvsUnzDp4SvZhaRFncQCkLYO4H
	9ntgC9mQF2t9bXn0S59J5RQ==
X-Received: by 2002:a05:7022:324:b0:127:3b1d:f593 with SMTP id
 a92af1059eb24-128b7086624mr1846052c88.9.1772693391456; Wed, 04 Mar 2026
 22:49:51 -0800 (PST)
MIME-Version: 1.0
References: <20260305-scmi-imx-reset-v1-0-18de78978ba9@nxp.com> <20260305-scmi-imx-reset-v1-1-18de78978ba9@nxp.com>
In-Reply-To: <20260305-scmi-imx-reset-v1-1-18de78978ba9@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 5 Mar 2026 08:52:41 +0200
X-Gm-Features: AaiRm505xBxL2PxE2YKJ3MTVjZe8kemHLRhSvtWvM-ybN_ZTK85FYION66BVMA4
Message-ID: <CAEnQRZC4w3qNOJgth=8N-Ri3wFeKc-=VnQXWzr4WR0j6yt7WMQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] firmware: arm_scmi: imx: Support getting reset reason
 of MISC protocol
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_224952_969229_BD686451 
X-CRM114-Status: GOOD (  13.16  )
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

On Thu, Mar 5, 2026 at 3:55=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> MISC protocol supports getting reset reason per Logical Machine or
> System. Add the API for user to retrieve the information from System
> Manager.

[..]

> +struct scmi_imx_misc_reset_reason_in {
> +#define MISC_REASON_FLAG_SYSTEM        BIT(0)
> +       __le32 flags;
> +};
> +
> +struct scmi_imx_misc_reset_reason_out {
> +       /* Boot reason flags */
> +#define MISC_BOOT_FLAG_VLD             BIT(31)
> +#define MISC_BOOT_FLAG_ORG_VLD         BIT(28)
> +#define MISC_BOOT_FLAG_ORIGIN          GENMASK(27, 24)
> +#define MISC_BOOT_FLAG_O_SHIFT         24
> +#define MISC_BOOT_FLAG_ERR_VLD         BIT(23)
> +#define MISC_BOOT_FLAG_ERR_ID          GENMASK(22, 8)
> +#define MISC_BOOT_FLAG_E_SHIFT         8
> +#define MISC_BOOT_FLAG_REASON          GENMASK(7, 0)

I would move this macros outside of the struct. Although the intention
is good it makes everything hard to read.

Just do:

struct scmi_imx_misc_reset_reason_out {
__le32 b_flags; /* MISC_BOOT_FLAG_* flags */
__le32 s_flags; /* MISC_SHUTDOWN_FLAG_* flags */
      /* Array of extended info words */
       __le32 extinfo[MISC_EXT_INFO_LEN_MAX];
}

[...]

> +static int scmi_imx_misc_reset_reason(const struct scmi_protocol_handle =
*ph, bool system,
> +                                     struct scmi_imx_misc_reset_reason *=
boot_r,
> +                                     struct scmi_imx_misc_reset_reason *=
shut_r,
> +                                     u32 *extinfo)
> +{
> +       struct scmi_imx_misc_reset_reason_in *in;
> +       struct scmi_imx_misc_reset_reason_out *out;
> +       struct scmi_xfer *t;
> +       int ret;
> +
> +       ret =3D ph->xops->xfer_get_init(ph, SCMI_IMX_MISC_RESET_REASON_GE=
T, sizeof(*in),
> +                                     sizeof(*out), &t);
> +       if (ret)
> +               return ret;
> +
> +       in =3D t->tx.buf;
> +       if (system)
> +               in->flags =3D le32_encode_bits(1, MISC_REASON_FLAG_SYSTEM=
);
> +       else
> +               in->flags =3D cpu_to_le32(0);

What does system =3D 0 mean? can you directly do in->flags =3D 0?


> +
> +       ret =3D ph->xops->do_xfer(ph, t);

Is it mandatory to call  ph->xops->xfer_put(ph, t); even if ret ! =3D 0?
Because we can get rid of one level of indentation with:

 ret =3D ph->xops->do_xfer(ph, t);
 if (ret)
    return ret;

