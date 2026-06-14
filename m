Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5B2CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 12:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s+Du+jaKu/RR1Vvr2XxT1BW3j9OgYSNRMzvt2kqdclc=; b=FWJdFCplNH24AP9xAlNOhGPpNp
	BwTmOaHUgjmv/K4msFQWivLod5VeWWh10BvvdkQHjBkoEprQIpIAc/0MvbVgYqn/KPEtH1YDRaweJ
	l/pUBSxVn8yHAhu3n93hmXWGAWqMlEiBjP7ZfeaVMXXLKCQc8cBZwcySQ25ariJG0uWCat3lhr/Sg
	wcPTHLD9KeMxYaYjMs3Jv4fBjDIZHCZi9k4dXreuf99AfQXA7yLTRW3rb5GaIWTU6bWkVb3p6bqqi
	paXgbaTOkl9AgJ0/rQkglwfNp7q6JzunZlWD+847m0C0pDi2elyIiSWziissSf90hHuSJUjalyLmi
	y5oj9DJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYjti-0000000CyP0-3QsZ;
	Sun, 14 Jun 2026 12:25:06 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYjtf-0000000CyOQ-48IB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 12:25:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Cc: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1781439901;
 bh=s+Du+jaKu/RR1Vvr2XxT1BW3j9OgYSNRMzvt2kqdclc=;
 b=VK8L8s/nLM0/ImgMbBUGNKJkRiijPLIqMup/XLqVkjCsY4TKbK1Q7t5enfh4kE3lwsNqefeNu
 wqUhWxDSINQH+ZNDrO1B+q0ZqzVOTyCcR0y6lViY25stNZZuucUwnnypYJv4mjwE8kIHbqDJWfS
 eSZ/9gJBAWLnXlOn9zwsrqIjzk8uqVPPWzFGyuGWM4O+nYg0Ll22Mmkp+e7w1kInhDpIOxeczlX
 seKB3J0G9bRN9YBwAEzsfZB2zJ+XwqV+OFm0imLWnVppeiQ54LgOwf+LGfVjWGBoAsOg3ONSdvb
 H+EbKAJ/QWA/S2kL0l2uyM/NUbMTVXoLJDIOUAtzt7+Q==
X-Forward-Email-ID: 6a2e9d9143cb3b89dce1feae
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.8.26
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Sun, 14 Jun 2026 08:24:48 -0400
Message-Id: <DJ8RQIPC5TW4.G2XIVOQPSXCK@ubuntu.com>
Cc: <linux-kernel@vger.kernel.org>, "Janne Grunau" <j@jannau.net>,
 <linux-arm-kernel@lists.infradead.org>, <linux-input@vger.kernel.org>,
 "Sven Peter" <sven@kernel.org>, <asahi@lists.linux.dev>, "Neal Gompa"
 <neal@gompa.dev>
Subject: Re: [PATCH v2] Input: apple_z2 - bound the device-reported finger
 count
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: <hexlabsecurity@proton.me>, "Sasha Finkelstein" <k@chaosmail.tech>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260613-b4-disp-4ebcbd68-v2-1-0161acfbd688@proton.me>
In-Reply-To: <20260613-b4-disp-4ebcbd68-v2-1-0161acfbd688@proton.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_052504_288680_1278C6F7 
X-CRM114-Status: GOOD (  27.12  )
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

On Sat Jun 13, 2026 at 9:22 PM EDT, Bryam Vargas via B4 Relay wrote:
> From: Bryam Vargas <hexlabsecurity@proton.me>
>
> apple_z2_parse_touches() takes the finger count from the touch
> controller's report and loops over that many fixed-size finger records
> without ever checking the count against the length of the report:
>
> 	nfingers =3D msg[APPLE_Z2_NUM_FINGERS_OFFSET];
> 	fingers =3D (struct apple_z2_finger *)(msg + APPLE_Z2_FINGERS_OFFSET);
> 	for (i =3D 0; i < nfingers; i++)
> 		/* read fingers[i] ... */
>
> msg points into the fixed 4000-byte z2->rx_buf and nfingers is a single
> device-supplied byte, so it can be as large as 255.  A malicious,
> malfunctioning or counterfeit controller (or an interposer on the SPI
> bus) can report a large finger count in a short packet, making the loop
> read up to 255 * sizeof(struct apple_z2_finger) bytes starting 24 bytes
> into msg -- far past the 4000-byte buffer.  This is a controller-driven
> heap out-of-bounds read, and the finger fields that are read (position,
> pressure, touch and tool dimensions) are forwarded to userspace as input
> events, leaking adjacent kernel memory.
>
> Bound the device-reported count to the number of finger records the
> report actually carries.
>
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/all/20260613215358.329921F000E9@smtp.kern=
el.org/
> Fixes: 471a92f8a21a ("Input: apple_z2 - add a driver for Apple Z2 touchsc=
reens")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryam Vargas <hexlabsecurity@proton.me>
> ---
> Changes since v1 [1]:
> - Keep the early-return at NUM_FINGERS_OFFSET instead of moving it to
>   FINGERS_OFFSET, so a short zero-finger ("all lifted") report still
>   reaches input_mt_sync_frame()/input_sync() and does not leave touches
>   stuck on the screen (caught by the sashiko-bot review of v1 [2]).  A
>   packet too short to hold even one finger record clamps nfingers to 0
>   instead of being dropped.
>
> [1] https://lore.kernel.org/all/20260613-b4-disp-f0148c89-v1-1-868a48b2a1=
87@proton.me/
> [2] https://lore.kernel.org/all/20260614000725.6B8D11F000E9@smtp.kernel.o=
rg/
>
> Reachable on every touch interrupt once the controller is booted
> (apple_z2_irq -> apple_z2_read_packet -> apple_z2_parse_touches).
>
> nfingers is bounded here by the message length; the message length is in
> turn bounded by the companion "Input: apple_z2 - bound the device-reporte=
d
> packet length" change (in flight), which caps the device-reported pkt_len
> to the 4000-byte receive buffer.  The two together close the device-drive=
n
> out-of-bounds accesses in apple_z2_parse_touches() / apple_z2_read_packet=
().
>
> Verified with a faithful in-kernel KASAN litmus (the verbatim 4000-byte
> buffer, the struct apple_z2_finger layout and the parse loop),
> CONFIG_KASAN=3Dy on x86_64:
>
>   Arm A, nfingers =3D 255 in a short packet (msg_len 19):
>     BUG: KASAN: slab-out-of-bounds in apple_z2_parse_touches
>     Read of size 2 ... 1 bytes to the right of allocated 4000-byte region
>     ... cache kmalloc-4k of size 4096
>   Arm B, with this patch: a zero-finger report (msg_len 19) reaches the
>     sync; a 255-finger claim is clamped to what the packet holds; clean.
>   Arm C, benign device (3 fingers): clean
>
>   AddressSanitizer (x86_64 and i386): heap-buffer-overflow READ, both ABI=
s.
>
> Reproducer and full logs available on request.
> ---
>  drivers/input/touchscreen/apple_z2.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/input/touchscreen/apple_z2.c b/drivers/input/touchsc=
reen/apple_z2.c
> index 271ababf0ad5..39ade83ef0de 100644
> --- a/drivers/input/touchscreen/apple_z2.c
> +++ b/drivers/input/touchscreen/apple_z2.c
> @@ -92,6 +92,12 @@ static void apple_z2_parse_touches(struct apple_z2 *z2=
,
>  		return;
>  	nfingers =3D msg[APPLE_Z2_NUM_FINGERS_OFFSET];
>  	fingers =3D (struct apple_z2_finger *)(msg + APPLE_Z2_FINGERS_OFFSET);
> +	/* a malicious controller can claim more fingers than the packet holds =
*/
> +	if (msg_len < APPLE_Z2_FINGERS_OFFSET)
> +		nfingers =3D 0;
> +	else
> +		nfingers =3D min_t(int, nfingers,
> +				 (msg_len - APPLE_Z2_FINGERS_OFFSET) / sizeof(*fingers));
>  	for (i =3D 0; i < nfingers; i++) {
>  		slot =3D input_mt_get_slot_by_key(z2->input_dev, fingers[i].finger);
>  		if (slot < 0) {
>
> ---
> base-commit: 8e65320d91cdc3b241d4b94855c88459b91abf66
> change-id: 20260613-b4-disp-4ebcbd68-ed8a28672ccc
>
> Best regards,

Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>

