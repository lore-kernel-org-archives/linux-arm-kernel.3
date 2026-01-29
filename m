Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8B7D6B080
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 15:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6mJvDD1VpYWneH4exWtlRRFpCw/yxXuXg63uajYfPqQ=; b=00EV5T1hx8wscKJkUoSQcuFki8
	H4yE7vK0JU7B7tS2kUEDGsnTRe7g0KiojdBL+qeV921PauLk6ZbxvIXJxdRSRAfXhU0ta9r8FR8T4
	kzODW59mPD9UrR7gC8+IafN0W+KVlfV6BC3txOXSjdWekVc/sNYOohlxYH9iWwP6s8fh4u+8ox1HL
	dck9d6xFzmwoA2Xhq+21b3VLjuLbfovn+KAfR0XEBEotcpl64LyTOtfZUdu2DAdmWCR0koCEgV2ZK
	upP2Sze12rsjX9LlNxsSHnRWmhT+3Bw4cS9dmj2KZpOuQXHK1WGjPX41FU2HyTJ1w4rqSyirJ9Jss
	uTaK3E+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlUQm-00000000Ivk-0qBP;
	Thu, 29 Jan 2026 15:59:40 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlUQk-00000000IvC-0bFI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 15:59:39 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-1233bc1117fso1503230c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 07:59:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769702377; cv=none;
        d=google.com; s=arc-20240605;
        b=OaWfhafmq6dunb1TPd8XptlCUJfAdahg/HgmN4PSLMQH4dmOkLIFThcEA3YXlcqGdC
         89M7q59q9NLAbx8OR0hHWE0ztJ/0MG/GREFVRmQ3jHwxPjlxR8a5QZwLPv3xPbLkrZBI
         H5CQxFtsOHcL5fRTo3nzX8sf/k/VYIyT2MSKjqjueaNcKiD+J4z7pKR9gXNWLd3+ZtNz
         8xSCiVMz4Yb6WpuJ46hR09ncNbeSqBrlfQsXyz4sc4Tj3QvrG9pSSckVCcp/LuuH9cc2
         wurOOM0TlWuBOrpoPT5kiyD38Dg/krHI5dpSzFlYiQq0kUKECcmTSzoU80fowDRqMflP
         58YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6mJvDD1VpYWneH4exWtlRRFpCw/yxXuXg63uajYfPqQ=;
        fh=4JJo/KtDI0AFEee8wtQH+VOkmQpNdkYj/M857sHZTWQ=;
        b=eDTxg+nUPy+BzxFscQO5DNafJAhXW5dbLXwasyT39gPrvjsBI3sjfDmb03aN9QqGPp
         1R1GmAoXtuVsuqvd/LAyNrAZeaooz3KwSLsoZ/KAP7reKIYVpqeZxigB39qqPuTujFrA
         rsTAjey5PjNFGl7aqFVVqUx9RY6EmE1abfhZz0/9xuZ80jjgdPpIhYpRUc6bUt4zGMO0
         gO6PcIVpvA61X3R1iLtRZLt+KlL5ebG/IyZuxvdI8U3fCpyk7803behcMzmc8WqFOAMn
         CmgGW1Tr1+CtoZBHswDRTYiIDhFm6eOBCWZXISn+P78ftNVjM3fA71uANN/C1ztNqcs1
         ViaQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769702377; x=1770307177; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mJvDD1VpYWneH4exWtlRRFpCw/yxXuXg63uajYfPqQ=;
        b=RqzX3qitbmg6PgT76Bxt3/DCM9xX3mmQ/vpQkJeIzy4xD7f74vxocDI/JyFpb1M9Qb
         dweSjUf14ea4hzj0wW+YP6rIp/iP54fSXfA4B4vATS0yk/DH1H683hGqKpTBD1tcJJL/
         xwFATCi/GKMMkbzsjbR0XWIuEiCKVov3GKvDT874ls4SckrZh2RzsbCW2q2zLtmaGBWP
         P6/2mN+EmZNFIC+YJZ97gOtSnhFkS5TTA50nh07tJjVRZzmb9SS+iPkqcdUNgkcAHIod
         ekNeWbPHjxY9+tE9fG6JN16DUiC8oh8L7Gtir3RpfLcSdAnt6mxjV+9uBWKF8GayZW6E
         kC+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769702377; x=1770307177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6mJvDD1VpYWneH4exWtlRRFpCw/yxXuXg63uajYfPqQ=;
        b=gap+7QIDJDCnx1R4wFi/xOJqMu25hlZEMAUNaKLZT5k1frhYs/SoBNkNk+NYEYxZGE
         CDsB38t7cozer4E/03O2FxdCEeNoLn5opKCJM3fiDx/I/RpdKyobcTtXAkOe9Aw0AylB
         OrOeae7F76kMcotjW27Bw2pRKKyfGRHNBE6Q49d6G8a438j7j32lLReLbUq7t/1kAebU
         FDgS/i6fOxjpxZPBmTYiRIG9eahlu33aZKqy+J8v4Q8x9TXpXa8meSOUatuj2P2sQviJ
         +4/fa9525z261bz/L4bTwKrsrjhUeqs9WHkUZhU3ieOrJ1d3eK1kb9WbP2h0Rg2pGEU2
         lT4w==
X-Forwarded-Encrypted: i=1; AJvYcCUSpzjYuL7obuJwb1U/TeOZTSZGyb5uqKt4lR8gBveh8zNKNc2aKZCsWC7ruLYF17cAmWLwJSJKlBoAaqw93GPH@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4n86eAZCo1LJk7uTPkxAwEzZnujrAikedPhIjIxuajTjzL9CW
	tlUGtU/CCdE1ilnHsVQ8hZA+om77iIAfwAt7ldS52RCqTfLct9O9ciNsfnr2Lm74XAjxKP/cyc6
	nSVv+DypBYkWOWcbynHd+zn9cIIz4O7E=
X-Gm-Gg: AZuq6aI0dvnmN4Plc0C/441qQEVM6lSCCQfWmy1HUvVd2JCljBQcSsN6GPE/o62FfBl
	cOCBKz3NufEv0wIIl72ml8GpiAlKqP3WzGXkiNNu3aNV7T+TwxJ0VnJ6NFZpPDzfyj8vi2uNVgd
	WmA88Kq7DnsSGLQVEAREkLSwWIF7qnhhAu8Xke4JP5NonvazLIj4AydHQ39kW+t1MsIflQ/6sY2
	uh1n78mzjasAFGoeZgr2wrVz3OTWiXaiLES+GN9Rs0eY+bA036GJyHkV9sT9lFnHwiO6OMMWpDD
	6UN8GSP9N3tZQBWXyNOV7g815HUCnTzc9/MLrqaMXNK87ricvVQ8QI3mbovMI1Pbm96X+ojazUF
	AFnGQWgVFXeAJaA==
X-Received: by 2002:a05:7022:128d:b0:11b:f271:835a with SMTP id
 a92af1059eb24-124b100d8camr2199762c88.3.1769702377004; Thu, 29 Jan 2026
 07:59:37 -0800 (PST)
MIME-Version: 1.0
References: <20260129-imx-rproc-fix-v3-1-fc4e41e6e750@nxp.com>
In-Reply-To: <20260129-imx-rproc-fix-v3-1-fc4e41e6e750@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 29 Jan 2026 18:02:21 +0200
X-Gm-Features: AZwV_Qh0LikHrjwYELL0Qb32OlZcL13Rg7Wtaiv5oFtOG766mVjbDDliX8TbUzs
Message-ID: <CAEnQRZA-nMai9-CEdMqnr2drqBRXXPOKE3a+_3j4S_=x-bM0pQ@mail.gmail.com>
Subject: Re: [PATCH v3] remoteproc: imx: Fix invalid loaded resource table detection
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Frank Li <frank.li@nxp.com>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_075938_221766_2C445F19 
X-CRM114-Status: GOOD (  24.60  )
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

On Thu, Jan 29, 2026 at 3:45=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> imx_rproc_elf_find_loaded_rsc_table() may incorrectly report a loaded
> resource table even when the current firmware does not provide one.
>
> When the device tree contains a "rsc-table" entry, priv->rsc_table is
> non-NULL and denotes where a resource table would be located if one is
> present in memory. However, when the current firmware has no resource
> table, rproc->table_ptr is NULL. The function still returns
> priv->rsc_table, and the remoteproc core interprets this as a valid loade=
d
> resource table.
>
> Fix this by returning NULL from imx_rproc_elf_find_loaded_rsc_table() whe=
n
> there is no resource table for the current firmware (i.e. when
> rproc->table_ptr is NULL). This aligns the function's semantics with the
> remoteproc core: a loaded resource table is only reported when a valid
> table_ptr exists.
>
> With this change, starting firmware without a resource table no longer
> triggers a crash.
>
> Fixes: e954a1bd1610 ("remoteproc: imx_rproc: Use imx specific hook for fi=
nd_loaded_rsc_table")
> Cc: stable@vger.kernel.org
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Changes looks good to  me >

> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -729,6 +729,10 @@ imx_rproc_elf_find_loaded_rsc_table(struct rproc *rp=
roc, const struct firmware *
>  {
>         struct imx_rproc *priv =3D rproc->priv;
>
> +       /* No resource table in the firmware */
> +       if (!rproc->table_ptr)
> +               return NULL;

I wonder if we can make this change generic because it should happen
on other platforms also.

Maybe something like this:

remoteproc: core: Only copy loaded table when valid

Copy resource table in memory only when:
* the current loaded firmware provides one
AND
* there is an explicit request to have the rsc table copied in memory
via rsc-table

--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1281,7 +1281,7 @@ static int rproc_start(struct rproc *rproc,
const struct firmware *fw)
         * that any subsequent changes will be applied to the loaded versio=
n.
         */
        loaded_table =3D rproc_find_loaded_rsc_table(rproc, fw);
-       if (loaded_table) {
+       if (rproc->cached_table && loaded_table) {
                memcpy(loaded_table, rproc->cached_table, rproc->table_sz);
                rproc->table_ptr =3D loaded_table;
        }

