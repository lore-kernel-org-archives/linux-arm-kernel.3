Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973A5CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 09:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GT5k7NNhpJZZ3Z4dV7FccQcGuRptRglhhV64m8hW5dM=; b=w2sUCliV6OY7Rd6v45IMSOh0Xq
	8lxrtK/MQ5hLXnUT/5kDZaP0di21GmU2/0qmuVnJHJV65ikIE/D6qrrN6Pfw21ilv7xJrokOVHU67
	aakFyUVi5qS5E/p42EPsmWSp5/qOpSrRJVc6E5HLZLWCLK0UVMAr+k0VetTgNDBh0otjvxDdmP2ta
	UL0mJID+P9OlsUnp8KJBpr+G/qj/eaZ9LAcrIa7B9Q3uI9Ow91TQUfu7qM/ESWssYCWex9XPT7X4r
	OaulV9WWV3eN6DoXAKAF9oQsJf8calHEMRYc7rlKiVW2gHiQoJa5k7X0HkNycIZIWXgQVNR1+C18X
	rvXBK1Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxw0-0000000Ae1Y-37Bk;
	Fri, 12 Jun 2026 09:12:16 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxvx-0000000Ae07-2aj2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 09:12:14 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-7e8833c99fcso7755907b3.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 02:12:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781255532; cv=none;
        d=google.com; s=arc-20240605;
        b=L6m2bZZ/Lg5Gq4QY3XdbJBqeBP7EzdFchjDLOatAx4ahBS8UlPPP4JbX8OXeh0IoHt
         y85vJoLhN39/uLfbANb5gqoVaw1rl78T/D1Ls7DPGvwWJdLidT89NSwr0LKH77luOSuG
         NGZEIQqIoslhXf4zawYGDBpofQVhqBVOxijBrrq+Q23Rrq15HRAK9akinAQnUDKFlNPF
         1o4gzHFVEc+n67VYwsL7SgElSdvH0nI7jfN/U+6ZkSXRX8GMNX9oqacgCXvNTRU/gi4o
         /YGq1QPjBfm+mrvPH3mkK60DTsF2rVvdQJ1rBmC1ZL6jtpCDBHpNNv5w2BfR3i5aTUTC
         RSXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GT5k7NNhpJZZ3Z4dV7FccQcGuRptRglhhV64m8hW5dM=;
        fh=oMN2Zkglzzc3GMwHp+8xTWupQdC0whbBZAfdH9/Mvtc=;
        b=cFml+8WsoE5qIdkFWEXZ4ysI0liKuq2reJ9ve7o6yG/B8UCC6CxLJpHZPckYfde9R0
         hO/w/IRnyEH8/OJh8kDtWFC7X4mYUFAFBHd5cfy4ldudqi8pyv1BaTMCgQiztbq9z7kj
         ghmWNSoAi3jL46I2HkifKDjrAm3WeaoGKuP6fTDjCuxAJC9DFDwawbMjzFycLytxQ+fQ
         Hucf8t0ImR8T3CSvjZCcLOiYfaFtVGUzK7PhfWd11ADfMsjYdjisjh9QeBblrlDafUrs
         ro/Zaz5B2RWTZY+5NomBxb9bqzWLlNLwuCsu3k7+vHmNv5bWINhBtBW6zsVL0UI0dj7a
         h4Cg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781255532; x=1781860332; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GT5k7NNhpJZZ3Z4dV7FccQcGuRptRglhhV64m8hW5dM=;
        b=J6gots6bxF9OilbYTIHEFj0/xm6+hXVh4z/gBonxj0sYcsjQYpYvhxWptaYv8ao3uq
         ibVMWkQzA7xXw04kRrL2JTGSJV4szK7CqUXYnsY5oRXqL6n3x3LIHfiMuUcebVDCI5kZ
         KJGLfYygkSvhrfzvmC9jc0fS/FpW/JchkzFyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781255532; x=1781860332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GT5k7NNhpJZZ3Z4dV7FccQcGuRptRglhhV64m8hW5dM=;
        b=lGTrW2sR7PsiXWaTptJA5KY+DX9/eJMYtbqvMVyg8zz+K5GniRnvNUAn7pf3aT9W9p
         47LOSve8gBX5gp/bnEh+dihG8kquRQeCpqZo95STu1GzJwncivBAAmHbPdOq8JIEJ7sG
         kM3QcBogFwEJt13yu+5Rv2eTtCEVknzpsOxF1zjMigvMeV/Xyt+rAYhzpReCeMPIAt/A
         n2dtg5Doyn+JHNRYKAyJiDQatXwogyyCOCb2MjZg5+Ef2smaacZ/r1AMg9MrO4RulXGD
         6N6HMrLFbgDq/sefpjoAdpfB0HQgQVhgQh+469YRVMd+Zv6x5La9LUzqg46fDjT8S4Yj
         H36g==
X-Forwarded-Encrypted: i=1; AFNElJ+JQSBKODhs4Ex/JMtZzt8KjnQ6lKwSGQAADaz5c/+p7aUTfUXR1IK06UT6nKY5sPD8MbULTVrnPENN4YDtFY/6@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+wC1jBWJfi12qEySTZL/En10DU2GBjzKiMuVGln+kXX6jusEE
	gbLkuCTXeXTedd+D38su3x7AdZ6MYcRFIAPbRcMDlSTLkLbmq7n5yueRq8IIpQBtmBA/sVyNw9h
	3/Bsm3PYS2xg3vJigSnU52iFmlOFyIGxuFTXysDpU
X-Gm-Gg: Acq92OEFk0k9TCoRvWwYWyvS/eY3ZudE4ExamNroxZsFToevhnUH2Y9A/jfUwnVZMq1
	3fYp9xhZecPHmhvvUkDNQSsAi5iwGC5a68xpt06kJIOq6IiuYdX7l8y0J/njKv0os1z/1ggoq7b
	5gdjtQq8Ce71KTBciBBlHLS/hBBtNtso+7u8ywNxdZGYPdqCd1Tdktyh6oO7yhcA8ct1OIKRsP+
	keFxmis/wrC1stx3Q9J7p4Qbi1o0EZ28s5pZSMen0ZMu/OZ6zvo5wTOKcnOgMiix49BwkDgrNvX
	2iP1+QZr
X-Received: by 2002:a05:690c:f0a:b0:7ef:d039:a334 with SMTP id
 00721157ae682-7f7bcf0d73cmr16871217b3.22.1781255532401; Fri, 12 Jun 2026
 02:12:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-11-wenst@chromium.org>
 <ail1sAxgh5Xtkj2y@ashevche-desk.local>
In-Reply-To: <ail1sAxgh5Xtkj2y@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Jun 2026 18:12:01 +0900
X-Gm-Features: AVVi8Cc47lUt9lrnuGQ2TayhjSsjO0Ufug4-8BS--usEeOHUYmKa3VTCiJvbq60
Message-ID: <CAGXv+5Fkp9R3i+WnCunbydJpn_rjxX5Cz9Cb=auS-cR1RE=R8g@mail.gmail.com>
Subject: Re: [PATCH v2 10/16] power: sequencing: pcie-m2: support matching on
 remote "port" node
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_021213_653502_131EE311 
X-CRM114-Status: GOOD (  15.35  )
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

On Wed, Jun 10, 2026 at 11:33=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jun 10, 2026 at 04:40:44PM +0800, Chen-Yu Tsai wrote:
> > A USB hub can have multiple ports, and this driver needs to
> > differentiate which port is being matched to. The USB hub driver now
> > associates the "port" node with the usb_port device, so here we can
> > use the remote "port" node to check for a match. Then fall back to
> > the remote device node for the other connection types.
>
> ...
>
> > +             if (remote_port && remote_port =3D=3D dev_of_node(dev))
> > +                     return PWRSEQ_MATCH_OK;
> >               if (remote && (remote =3D=3D dev_of_node(dev)))
> >                       return PWRSEQ_MATCH_OK;
>
> We have device_match_of_node() IIRC the name of that API.

Ack. Will also replace the existing instance.

